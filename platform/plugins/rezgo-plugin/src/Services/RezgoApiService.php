<?php

namespace Botble\RezgoConnector\Services;

use Illuminate\Support\Facades\Http;
use Botble\RezgoConnector\Models\RezgoLog;

class RezgoApiService
{
    private RezgoSettingsService $settings;
    private string $baseUrl = 'https://api.rezgo.com/xml';

    public function __construct(RezgoSettingsService $settings)
    {
        $this->settings = $settings;
    }

    // =========================================================================
    // BOOKING
    // =========================================================================

    public function commitBooking(array $bookingData): array
    {
        if (!$this->settings->isConfigured()) {
            $error = 'Rezgo API not configured. Please add CID and API Key in settings.';
            RezgoLog::error('commit_booking', null, $error);
            return ['success' => false, 'error' => $error, 'status' => 0];
        }

        try {
            $orderId    = $bookingData['order_id'] ?? null;
            $xmlPayload = $this->buildCommitXmlPayload($bookingData);

            $logData = $bookingData;
            unset($logData['key']);
            RezgoLog::sync('commit_booking', $orderId, 'Submitting booking via POST XML', $logData);
            RezgoLog::sync('commit_booking', $orderId, 'XML Payload: ' . $xmlPayload);

            $response = Http::timeout(30)
                ->withHeaders(['Content-Type' => 'application/xml'])
                ->withBody($xmlPayload, 'application/xml')
                ->post($this->baseUrl);

            $responseBody = $response->body();
            RezgoLog::sync('commit_booking', $orderId, 'Raw Rezgo response: ' . $responseBody);

            $responseData = $this->parseXmlResponse($responseBody);

            if (!is_array($responseData)) {
                $responseData = ['content' => $responseData];
            }

            $isSuccess = isset($responseData['status']) && $responseData['status'] == 1;

            if ($isSuccess) {
                $transNum = $responseData['trans_num'] ?? $responseData['booking_id'] ?? null;
                RezgoLog::sync('commit_booking', $orderId, 'Booking successful - Transaction #' . $transNum, ['trans_num' => $transNum]);
                return [
                    'success'   => true,
                    'status'    => 200,
                    'data'      => $responseData,
                    'trans_num' => $transNum,
                    'message'   => 'Booking complete',
                ];
            }

            $error     = $responseData['e'] ?? $responseData['message'] ?? 'No success status from Rezgo';
            $errorCode = $responseData['error_code'] ?? 'N/A';
            RezgoLog::error('commit_booking', $orderId, "Booking failed [$errorCode]: $error", $responseData);
            return [
                'success'    => false,
                'status'     => $response->status(),
                'error'      => $error,
                'error_code' => $errorCode,
                'data'       => $responseData,
            ];

        } catch (\Exception $e) {
            RezgoLog::error('commit_booking', $bookingData['order_id'] ?? null, 'API request failed: ' . $e->getMessage());
            return ['success' => false, 'error' => $e->getMessage(), 'status' => 0];
        }
    }

    // =========================================================================
    // INVENTORY SEARCH
    // =========================================================================

    public function searchInventory(array $filters = []): array
    {
        if (!$this->settings->isConfigured()) {
            return ['success' => false, 'error' => 'API not configured'];
        }

        try {
            $cid    = $this->settings->getCid();
            $apiKey = $this->settings->getApiKey();

            $xml  = '<?xml version="1.0" encoding="UTF-8"?>' . PHP_EOL;
            $xml .= '<request>' . PHP_EOL;
            $xml .= '  <transcode>' . htmlspecialchars($cid)    . '</transcode>' . PHP_EOL;
            $xml .= '  <key>'       . htmlspecialchars($apiKey) . '</key>'       . PHP_EOL;
            $xml .= '  <instruction>search</instruction>'                        . PHP_EOL;
            if (isset($filters['filter_type'])) {
                $xml .= '  <filter_type>' . htmlspecialchars($filters['filter_type']) . '</filter_type>' . PHP_EOL;
            }
            $xml .= '</request>' . PHP_EOL;

            $response     = Http::timeout(30)
                ->withHeaders(['Content-Type' => 'application/xml'])
                ->withBody($xml, 'application/xml')
                ->post($this->baseUrl);

            $responseData = $this->parseXmlResponse($response->body());
            return ['success' => !isset($responseData['error']), 'data' => $responseData];

        } catch (\Exception $e) {
            RezgoLog::error('search_inventory', null, 'Search failed: ' . $e->getMessage());
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    // =========================================================================
    // COMPANY INFO
    // =========================================================================

    public function getCompanyInfo(): array
    {
        if (!$this->settings->isConfigured()) {
            return ['success' => false, 'error' => 'API not configured'];
        }

        try {
            $cid    = $this->settings->getCid();
            $apiKey = $this->settings->getApiKey();

            $xml  = '<?xml version="1.0" encoding="UTF-8"?>' . PHP_EOL;
            $xml .= '<request>' . PHP_EOL;
            $xml .= '  <transcode>' . htmlspecialchars($cid)    . '</transcode>' . PHP_EOL;
            $xml .= '  <key>'       . htmlspecialchars($apiKey) . '</key>'       . PHP_EOL;
            $xml .= '  <instruction>company</instruction>'                       . PHP_EOL;
            $xml .= '</request>' . PHP_EOL;

            $response     = Http::timeout(30)
                ->withHeaders(['Content-Type' => 'application/xml'])
                ->withBody($xml, 'application/xml')
                ->post($this->baseUrl);

            $responseData = $this->parseXmlResponse($response->body());
            return ['success' => !isset($responseData['error']), 'data' => $responseData];

        } catch (\Exception $e) {
            RezgoLog::error('get_company', null, 'Failed: ' . $e->getMessage());
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    // =========================================================================
    // FULL ITEM DETAIL
    // =========================================================================

    public function getItemFull(string $uid): array
    {
        if (!$this->settings->isConfigured()) {
            return ['success' => false, 'error' => 'API not configured'];
        }

        try {
            $cid    = $this->settings->getCid();
            $apiKey = $this->settings->getApiKey();

            $url = $this->baseUrl
                . '?transcode=' . urlencode($cid)
                . '&key='       . urlencode($apiKey)
                . '&i=search'
                . '&t=uid'
                . '&q='         . urlencode($uid);

            $response     = Http::timeout(30)->get($url);
            $responseData = $this->parseXmlResponse($response->body());

            $item = $responseData['item'] ?? $responseData['tour'] ?? null;

            if (is_array($item) && isset($item[0]) && is_array($item[0])) {
                foreach ($item as $candidate) {
                    if (isset($candidate['uid']) && (string)$candidate['uid'] === (string)$uid) {
                        $item = $candidate;
                        break;
                    }
                }
                if (is_array($item) && isset($item[0])) {
                    $item = $item[0];
                }
            }

            if ($item && is_array($item)) {
                return ['success' => true, 'data' => $item];
            }

            RezgoLog::error('get_item_full', null, 'Item not found for uid: ' . $uid);
            return ['success' => false, 'error' => 'Item not found'];

        } catch (\Exception $e) {
            RezgoLog::error('get_item_full', null, 'Failed: ' . $e->getMessage());
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    public function getItemDetails(string $uid): array
    {
        return $this->getItemFull($uid);
    }

    // =========================================================================
    // EXTRACTION HELPERS
    // =========================================================================

    public function extractDescription(array $itemData): string
    {
        $fields = ['desc', 'description', 'details', 'overview', 'highlights', 'inclusions', 'notes', 'content', 'tour_desc'];

        foreach ($fields as $field) {
            if (!empty($itemData[$field])) {
                $value = $itemData[$field];
                if (is_array($value)) {
                    $value = array_filter($value, function($v) {
                        return !is_array($v) && !empty(trim((string)$v));
                    });
                    if (!empty($value)) {
                        $value = implode(' ', $value);
                    }
                }
                if (!empty($value)) {
                    return trim((string)$value);
                }
            }
        }

        if (!empty($itemData['details']) && is_array($itemData['details'])) {
            $details = $itemData['details'];
            $nestedFields = ['overview', 'highlights', 'description', 'content', 'tour_desc', 'desc'];
            $parts = [];
            foreach ($nestedFields as $field) {
                if (!empty($details[$field])) {
                    $value = $details[$field];
                    if (is_array($value)) {
                        $value = implode(' ', array_filter($value, 'is_string'));
                    }
                    $value = trim((string)$value);
                    if ($value) {
                        $parts[] = $value;
                    }
                }
            }
            if (!empty($parts)) {
                return implode("\n\n", $parts);
            }
        }

        return '';
    }

    /**
     * Extract price for import.
     * For variable-priced tours (ticket_pricing=variable, starting=0.00),
     * we use i=month to find the first available date then i=search&d=DATE
     * to get the actual price. This is the "starting from" price for the listing.
     */
    public function extractPrice(array $itemData, ?string $uid = null): float
    {
        // Try starting field first — works for fixed-price tours
        $starting = (float)($itemData['starting'] ?? 0);
        if ($starting > 0) {
            \Log::info('Rezgo extractPrice: found starting price', ['uid' => $uid, 'price' => $starting]);
            return $starting;
        }

        // Try price_list
        if (!empty($itemData['price_list'])) {
            $priceList = $itemData['price_list'];
            if (!isset($priceList[0])) $priceList = [$priceList];
            foreach ($priceList as $entry) {
                if (is_array($entry) && !empty($entry['price'])) {
                    $price = (float)$entry['price'];
                    if ($price > 0) {
                        \Log::info('Rezgo extractPrice: found price_list price', ['uid' => $uid, 'price' => $price]);
                        return $price;
                    }
                }
            }
        }

        // Variable-priced tour (ticket_pricing=variable) — fetch first available date price
        // Uses i=month to find available days, then i=search&d=DATE for the price
        if ($uid) {
            \Log::info('Rezgo extractPrice: variable pricing, fetching first available date price', ['uid' => $uid]);
            try {
                $year  = (int)date('Y');
                $month = (int)date('m');

                // Check up to 6 months ahead
                for ($i = 0; $i < 6; $i++) {
                    $checkYear  = $year;
                    $checkMonth = $month + $i;
                    if ($checkMonth > 12) { $checkMonth -= 12; $checkYear++; }

                    $monthData = $this->fetchMonthAvailability($uid, $checkYear, $checkMonth);
                    if (!$monthData['success'] || empty($monthData['available_days'])) continue;

                    // Try the first available day
                    $day     = $monthData['available_days'][0];
                    $dateStr = sprintf('%04d-%02d-%02d', $checkYear, $checkMonth, $day);
                    $price   = $this->fetchPriceForDate($uid, $dateStr);

                    if ($price > 0) {
                        \Log::info('Rezgo extractPrice: found variable price', ['uid' => $uid, 'date' => $dateStr, 'price' => $price]);
                        return $price;
                    }
                }
            } catch (\Exception $e) {
                \Log::warning('Rezgo extractPrice: variable price fetch failed', ['uid' => $uid, 'error' => $e->getMessage()]);
            }
        }

        \Log::warning('Rezgo extractPrice: no price found, returning 0', ['uid' => $uid]);
        return 0.00;
    }

    public function extractPhotoUrls(array $itemData): array
    {
        $urls = [];
        $cid  = $itemData['cid'] ?? $this->settings->getCid();

        if (!empty($itemData['media'])) {
            $media = $itemData['media'];
            if (isset($media['image'])) {
                $img = $media['image'];
                if (is_array($img)) {
                    if (!empty($img['path'])) {
                        $urls[] = $this->buildPhotoUrl($img['path'], $cid);
                    } elseif (!empty($img['url'])) {
                        $urls[] = $img['url'];
                    }
                } elseif (!empty($img)) {
                    $urls[] = $this->buildPhotoUrl($img, $cid);
                }
            }
        }

        if (!empty($itemData['images'])) {
            $images = $itemData['images'];
            if (!isset($images[0])) $images = [$images];
            foreach ($images as $img) {
                if (is_array($img)) {
                    if (!empty($img['url'])) $urls[] = $img['url'];
                    elseif (!empty($img['filename'])) $urls[] = $this->buildPhotoUrl($img['filename'], $cid);
                } elseif (!empty($img)) {
                    $urls[] = $this->buildPhotoUrl($img, $cid);
                }
            }
        }

        if (!empty($itemData['photo'])) {
            $photos = $itemData['photo'];
            if (!isset($photos[0])) $photos = [$photos];
            foreach ($photos as $photo) {
                if (is_array($photo) && !empty($photo['filename'])) {
                    $urls[] = $this->buildPhotoUrl($photo['filename'], $cid);
                } elseif (is_string($photo) && !empty($photo)) {
                    $urls[] = $this->buildPhotoUrl($photo, $cid);
                }
            }
        }

        return array_slice(array_unique($urls), 0, 5);
    }

    // =========================================================================
    // DYNAMIC PRICING — CALENDAR
    // =========================================================================

    /**
     * Fetch monthly availability using the correct Rezgo i=month endpoint.
     * Returns which day numbers are available (condition="a").
     * Structure: <day value="1" condition="a"><item value="9999">...
     * condition="a" = available, condition="u" = unavailable
     * The item @value attribute = availability count (not price).
     */
    public function fetchMonthAvailability(string $uid, int $year, int $month): array
    {
        if (!$this->settings->isConfigured()) {
            return ['success' => false, 'error' => 'API not configured'];
        }

        $cid    = $this->settings->getCid();
        $apiKey = $this->settings->getApiKey();
        $d      = sprintf('%04d-%02d', $year, $month);

        $url = $this->baseUrl
            . '?transcode=' . urlencode($cid)
            . '&key='       . urlencode($apiKey)
            . '&i=month'
            . '&q='         . urlencode($uid)
            . '&d='         . $d;

        \Log::info('Rezgo fetchMonthAvailability', ['uid' => $uid, 'year' => $year, 'month' => $month]);

        $response = Http::timeout(30)->get($url);
        $data     = $this->parseXmlResponse($response->body());

        // Response has <day value="N" condition="a|u"> nodes
        // xmlToArray puts XML attributes as @attrname
        $days = $data['day'] ?? null;
        if (!$days) {
            return ['success' => true, 'available_days' => []];
        }

        // Normalize single day vs array of days
        if (isset($days['@value'])) {
            $days = [$days];
        }

        $availableDays = [];
        foreach ($days as $day) {
            $condition = $day['@condition'] ?? $day['condition'] ?? 'u';
            $dayNum    = (int)($day['@value'] ?? $day['value'] ?? 0);
            if ($dayNum > 0 && $condition === 'a') {
                $availableDays[] = $dayNum;
            }
        }

        return ['success' => true, 'available_days' => $availableDays];
    }

    /**
     * Fetch price for a specific date using i=search&d=YYYY-MM-DD.
     * The search endpoint returns date blocks with price_adult/price_child
     * when a specific date is passed via the d= parameter.
     * Returns the adult price or 0 if not found.
     */
    public function fetchPriceForDate(string $uid, string $date): float
    {
        if (!$this->settings->isConfigured()) {
            return 0.0;
        }

        $cid    = $this->settings->getCid();
        $apiKey = $this->settings->getApiKey();

        $url = $this->baseUrl
            . '?transcode=' . urlencode($cid)
            . '&key='       . urlencode($apiKey)
            . '&i=search'
            . '&t=uid'
            . '&q='         . urlencode($uid)
            . '&d='         . urlencode($date);

        $response = Http::timeout(30)->get($url);
        $data     = $this->parseXmlResponse($response->body());

        $item = $data['item'] ?? null;
        if (!$item) return 0.0;

        // Normalize to array
        if (isset($item['uid'])) $item = [$item];

        foreach ($item as $candidate) {
            // Date block is nested inside the item when d= is passed
            $dateBlock = $candidate['date'] ?? null;
            if (!$dateBlock) continue;

            // Single date block
            if (isset($dateBlock['@value'])) $dateBlock = [$dateBlock];
            elseif (isset($dateBlock['active'])) $dateBlock = [$dateBlock];

            foreach ((array)$dateBlock as $block) {
                $active = $block['active'] ?? '0';
                if ($active != '1') continue;
                $price = (float)($block['price_adult'] ?? $block['adult'] ?? 0);
                if ($price > 0) return $price;
            }

            // Also check starting field directly on item (fixed price tours)
            $starting = (float)($candidate['starting'] ?? 0);
            if ($starting > 0) return $starting;
        }

        return 0.0;
    }

    /**
     * Get pricing for all dates in a month.
     * Uses i=month to get available days, then i=search&d=DATE for each available day.
     * Results are cached for 1 hour to avoid hammering the API.
     */
    public function getPricingForMonth(string $uid, int $year, int $month): array
    {
        if (!$this->settings->isConfigured()) {
            return ['success' => false, 'error' => 'API not configured'];
        }

        $cacheKey = 'rezgo_month_' . $uid . '_' . $year . '_' . $month;
        $cached   = \Illuminate\Support\Facades\Cache::get($cacheKey);
        if ($cached) return $cached;

        try {
            $lastDay      = (int)date('t', mktime(0, 0, 0, $month, 1, $year));
            $monthAvail   = $this->fetchMonthAvailability($uid, $year, $month);
            $availableDays = $monthAvail['available_days'] ?? [];
            $dates = [];

            for ($day = 1; $day <= $lastDay; $day++) {
                $dateStr = sprintf('%04d-%02d-%02d', $year, $month, $day);

                if (!in_array($day, $availableDays)) {
                    $dates[] = [
                        'success'      => false,
                        'date'         => $dateStr,
                        'available'    => false,
                        'availability' => 0,
                        'price_adult'  => 0,
                        'price_child'  => 0,
                        'price_senior' => 0,
                    ];
                    continue;
                }

                // Fetch price for this specific available date
                $adultPrice = $this->fetchPriceForDate($uid, $dateStr);

                $dates[] = [
                    'success'      => true,
                    'date'         => $dateStr,
                    'available'    => $adultPrice > 0,
                    'availability' => 999,
                    'price_adult'  => $adultPrice,
                    'price_child'  => 0, // child price requires separate logic if needed
                    'price_senior' => 0,
                ];
            }

            $result = [
                'success' => true,
                'uid'     => $uid,
                'year'    => $year,
                'month'   => $month,
                'dates'   => $dates,
            ];

            \Illuminate\Support\Facades\Cache::put($cacheKey, $result, 3600);
            return $result;

        } catch (\Exception $e) {
            \Log::error('Rezgo getPricingForMonth: ' . $e->getMessage());
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Get pricing for a single date.
     */
    public function getPricingByDate(string $uid, string $date): array
    {
        if (!$this->settings->isConfigured()) {
            return ['success' => false, 'error' => 'API not configured'];
        }

        $year  = (int)date('Y', strtotime($date));
        $month = (int)date('m', strtotime($date));

        $monthResult = $this->getPricingForMonth($uid, $year, $month);
        if (!($monthResult['success'] ?? false)) {
            return ['success' => false, 'error' => $monthResult['error'] ?? 'Failed to load month data'];
        }

        foreach ($monthResult['dates'] ?? [] as $dayData) {
            if (($dayData['date'] ?? '') === $date) return $dayData;
        }

        return [
            'success'      => false,
            'date'         => $date,
            'available'    => false,
            'availability' => 0,
            'price_adult'  => 0,
            'price_child'  => 0,
            'price_senior' => 0,
        ];
    }

    /**
     * Legacy — kept for any callers that still reference fetchAllTourDates.
     * Now just returns available dates from fetchMonthAvailability for current month.
     */
    public function fetchAllTourDates(string $uid): array
    {
        $year  = (int)date('Y');
        $month = (int)date('m');
        $result = $this->fetchMonthAvailability($uid, $year, $month);
        if (!$result['success']) return $result;
        // Return in old format for any legacy callers
        $dates = array_map(fn($d) => ['@value' => sprintf('%04d-%02d-%02d', $year, $month, $d), 'active' => '1'], $result['available_days']);
        return ['success' => true, 'dates' => $dates];
    }

    // =========================================================================
    // PRIVATE HELPERS
    // =========================================================================

    private function buildPhotoUrl(string $filename, string $cid): string
    {
        if (filter_var($filename, FILTER_VALIDATE_URL)) return $filename;
        return 'https://cdn.rezgo.com/photos/' . $cid . '/' . ltrim($filename, '/');
    }

    private function buildCommitXmlPayload(array $bookingData): string
    {
        $cid    = $this->settings->getCid();
        $apiKey = $this->settings->getApiKey();

        $uid         = htmlspecialchars($bookingData['book']               ?? '');
        $date        = htmlspecialchars($bookingData['date']               ?? date('Y-m-d', strtotime('+1 day')));
        $numAdults   = (int)($bookingData['adult_num']                     ?? 1);
        $numChildren = (int)($bookingData['child_num']                     ?? 0);
        $numSeniors  = (int)($bookingData['senior_num']                    ?? 0);

        $firstName = htmlspecialchars($bookingData['tour_first_name']    ?? 'Dreamzone');
        $lastName  = htmlspecialchars($bookingData['tour_last_name']     ?? 'Test');
        $email     = htmlspecialchars($bookingData['tour_email_address'] ?? 'test@dreamzone.com');
        $phone     = htmlspecialchars($bookingData['tour_phone_number']  ?? '4075550123');
        $address   = htmlspecialchars($bookingData['tour_address_1']     ?? '123 Main St');
        $city      = htmlspecialchars($bookingData['tour_city']          ?? 'Orlando');
        $state     = htmlspecialchars($bookingData['tour_stateprov']     ?? 'FL');
        $postal    = htmlspecialchars($bookingData['tour_postal_code']   ?? '32801');
        $country   = htmlspecialchars($bookingData['tour_country']       ?? 'US');

        $xml  = '<?xml version="1.0" encoding="UTF-8"?>' . PHP_EOL;
        $xml .= '<request>' . PHP_EOL;
        $xml .= '  <transcode>' . htmlspecialchars($cid) . '</transcode>' . PHP_EOL;
        $xml .= '  <key>'       . htmlspecialchars($apiKey) . '</key>'   . PHP_EOL;
        $xml .= '  <instruction>commit</instruction>'                     . PHP_EOL;
        $xml .= '  <booking>' . PHP_EOL;
        $xml .= '    <book>' . $uid  . '</book>' . PHP_EOL;
        $xml .= '    <date>' . $date . '</date>' . PHP_EOL;
        if ($numAdults > 0)   $xml .= '    <adult_num>'  . $numAdults   . '</adult_num>'  . PHP_EOL;
        if ($numChildren > 0) $xml .= '    <child_num>'  . $numChildren . '</child_num>'  . PHP_EOL;
        if ($numSeniors > 0)  $xml .= '    <senior_num>' . $numSeniors  . '</senior_num>' . PHP_EOL;
        $xml .= '  </booking>' . PHP_EOL;
        $xml .= '  <payment>' . PHP_EOL;
        $xml .= '    <tour_first_name>'    . $firstName . '</tour_first_name>'    . PHP_EOL;
        $xml .= '    <tour_last_name>'     . $lastName  . '</tour_last_name>'     . PHP_EOL;
        $xml .= '    <tour_email_address>' . $email     . '</tour_email_address>' . PHP_EOL;
        $xml .= '    <tour_phone_number>'  . $phone     . '</tour_phone_number>'  . PHP_EOL;
        $xml .= '    <tour_address_1>'     . $address   . '</tour_address_1>'     . PHP_EOL;
        $xml .= '    <tour_city>'          . $city      . '</tour_city>'          . PHP_EOL;
        $xml .= '    <tour_stateprov>'     . $state     . '</tour_stateprov>'     . PHP_EOL;
        $xml .= '    <tour_postal_code>'   . $postal    . '</tour_postal_code>'   . PHP_EOL;
        $xml .= '    <tour_country>'       . $country   . '</tour_country>'       . PHP_EOL;
        $xml .= '    <agree_terms>1</agree_terms>'          . PHP_EOL;
        $xml .= '  </payment>' . PHP_EOL;
        $xml .= '</request>' . PHP_EOL;
        return $xml;
    }

    private function parseXmlResponse(string $xmlBody)
    {
        try {
            $xml = simplexml_load_string($xmlBody, null, LIBXML_NOCDATA);
            if ($xml === false) return ['error' => 'Invalid XML response'];
            return $this->xmlToArray($xml);
        } catch (\Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    private function xmlToArray($xml)
    {
        if (is_string($xml)) return $xml;

        $array = [];

        foreach ($xml->children() as $name => $child) {
            $textContent = trim((string)$child);
            $children    = $child->children();
            $value       = count($children) > 0 ? $this->xmlToArray($child) : $textContent;

            if (isset($array[$name])) {
                if (!is_array($array[$name]) || !isset($array[$name][0])) {
                    $array[$name] = [$array[$name]];
                }
                $array[$name][] = $value;
            } else {
                $array[$name] = $value;
            }
        }

        if ($xml->attributes()) {
            foreach ($xml->attributes() as $name => $value) {
                $array['@' . $name] = (string)$value;
            }
        }

        return $array ?: (string)$xml;
    }
}
