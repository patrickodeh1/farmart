@if (! empty($product->video))
    @foreach($product->video as $video)
        @continue(! $video['url'])

        <div class="bb-product-video">
            @if ($video['provider'] === 'video')
                @php
                    $fileExtension = File::extension($video['url']);

                    if (! $fileExtension || $fileExtension === 'mov') {
                        $fileExtension = 'mp4';
                    }
                @endphp

                <video
                    id="{{ md5($video['url']) }}"
                    playsinline="playsinline"
                    muted
                    preload="auto"
                    class="media-video"
                    aria-label="{{ $product->name }}"
                    poster="{{ $video['thumbnail'] }}"
                    style="max-width: 100%;"
                >
                    <source src="{{ $video['url'] }}" type="video/{{ $fileExtension }}">
                    <img src="{{ $video['thumbnail'] }}" alt="{{ $video['url'] }}">
                </video>
                <button class="bb-button-trigger-play-video" data-target="{{ md5($video['url']) }}">
                    <x-core::icon name="ti ti-player-play-filled" />
                </button>
            @else
                <iframe
                    data-provider="{{ $video['provider'] }}"
                    src="{{ $video['url'] }}"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                </iframe>
            @endif
        </div>
    @endforeach
@endif
