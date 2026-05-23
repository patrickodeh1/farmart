<?php

namespace Botble\RezgoConnector\Http\Controllers;

use Botble\RezgoConnector\Models\RezgoProductMapping;
use Botble\RezgoConnector\Services\ExternalDatabaseSyncService;
use Botble\RezgoConnector\Services\RezgoApiService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class RezgoPricingApiController
{
    protected RezgoApiService $apiService;
    protected ExternalDatabaseSyncService $externalSyncService;

    public function __construct(
        RezgoApiService $apiService,
        ExternalDatabaseSyncService $externalSyncService
    ) {
        $this->apiService = $apiService;
        $this->externalSyncService = $externalSyncService;
    }

    /**
     * Get pricing for a specific date.
     * Query: ?uid=TOUR_UID&date=YYYY-MM-DD
     */
    public function getPricingByDate(Request $request): JsonResponse
    {
        $uid = $request->query('uid');
        $date = $request->query('date');

        if (!$uid || !$date) {
            return response()->json([
                'success' => false,
                'error' => 'Missing required parameters: uid, date',
            ], 400);
        }

        $result = $this->apiService->getPricingByDate($uid, $date);

        // Apply markup and gate price ceiling if mapping exists
        if ($result['success'] ?? false) {
            $result = $this->applyMarkupAndGatePrice($uid, $date, $result);
        }

        return response()->json($result);
    }

    /**
     * Get pricing for all dates in a month (for calendar).
     * Query: ?uid=TOUR_UID&year=2026&month=05
     */
    public function getPricingForMonth(Request $request): JsonResponse
    {
        $uid = $request->query('uid');
        $year = (int)$request->query('year');
        $month = (int)$request->query('month');

        if (!$uid || !$year || !$month) {
            return response()->json([
                'success' => false,
                'error' => 'Missing required parameters: uid, year, month',
            ], 400);
        }

        $result = $this->apiService->getPricingForMonth($uid, $year, $month);

        // Apply markup and gate price ceiling to each date if mapping exists
        if ($result['success'] ?? false) {
            if (isset($result['dates']) && is_array($result['dates'])) {
                foreach ($result['dates'] as &$dateResult) {
                    if (isset($dateResult['date']) && ($dateResult['success'] ?? false)) {
                        $dateResult = $this->applyMarkupAndGatePrice(
                            $uid, 
                            $dateResult['date'], 
                            $dateResult
                        );
                    }
                }
            }
        }

        return response()->json($result);
    }

    /**
     * Apply markup and gate price ceiling to pricing result
     */
    protected function applyMarkupAndGatePrice(string $rezgoUid, string $date, array $pricingResult): array
    {
        // Get product mapping for this Rezgo UID
        $mapping = RezgoProductMapping::where('rezgo_uid', $rezgoUid)->first();

        // If no mapping, return original pricing (no markup applied)
        if (!$mapping) {
            return $pricingResult;
        }

        // Get markup settings
        $markupType = $mapping->markup_type ?? 'percent';
        $markupValue = $mapping->markup_value ?? 10.0; // default 10%

        // Get raw Rezgo prices
        $rezgoAdultPrice = (float)($pricingResult['price_adult'] ?? 0);
        $rezgoChildPrice = (float)($pricingResult['price_child'] ?? 0);

        // Apply markup
        if ($markupType === 'percent') {
            $markedUpAdultPrice = $rezgoAdultPrice * (1 + $markupValue / 100);
            $markedUpChildPrice = $rezgoChildPrice * (1 + $markupValue / 100);
        } else { // fixed
            $markedUpAdultPrice = $rezgoAdultPrice + $markupValue;
            $markedUpChildPrice = $rezgoChildPrice + $markupValue;
        }

        // Gate price fetch removed — see commented block below.
        // $gatePrice = $this->externalSyncService->getGatePrice($rezgoUid, $date);

        // =====================================================================
        // GATE PRICE CEILING — temporarily disabled.
        // Waiting on client to confirm external DB table + column names.
        // ExternalDatabaseSyncService is still injected and ready — do not
        // remove it from the constructor.
        //
        // To restore, uncomment this block and remove the fallback below:
        //
        // $gatePrice = $this->externalSyncService->getGatePrice($rezgoUid, $date);
        //
        // if ($gatePrice !== null) {
        //     // Cap our price just below the walk-up gate price (1 cent buffer)
        //     $buffer        = 0.01;
        //     $maxAdultPrice = max($gatePrice - $buffer, $rezgoAdultPrice + $buffer);
        //     $maxChildPrice = max($gatePrice - $buffer, $rezgoChildPrice + $buffer);
        //     $finalAdultPrice = min($markedUpAdultPrice, $maxAdultPrice);
        //     $finalChildPrice = min($markedUpChildPrice, $maxChildPrice);
        // } else {
        //     $finalAdultPrice = max($markedUpAdultPrice, $rezgoAdultPrice + 0.01);
        //     $finalChildPrice = $rezgoChildPrice > 0
        //         ? max($markedUpChildPrice, $rezgoChildPrice + 0.01)
        //         : 0;
        // }
        //
        // Still needed from client before re-enabling:
        //   - Gate price table name           (assumed: ticket_prices  — unconfirmed)
        //   - Price column name               (confirmed: park_price)
        //   - UID column name                 (assumed: rezgo_uid      — unconfirmed)
        //   - Whether pricing is per-date or a single static row       (unconfirmed)
        // =====================================================================

        // Direct Rezgo markup only — floored at Rezgo wholesale + 1 cent for adult.
        // Child stays 0 if Rezgo returned 0 (tour has no child pricing).
        $finalAdultPrice = max($markedUpAdultPrice, $rezgoAdultPrice + 0.01);
        $finalChildPrice = $rezgoChildPrice > 0
            ? max($markedUpChildPrice, $rezgoChildPrice + 0.01)
            : 0;

        // Update pricing result
        $pricingResult['price_adult'] = round($finalAdultPrice, 2);
        $pricingResult['price_child'] = round($finalChildPrice, 2);

        // Mark as available if adult price is positive
        if ($finalAdultPrice > 0) {
            $pricingResult['available']    = true;
            $pricingResult['availability'] = 999;
        }

        return $pricingResult;
    }
}