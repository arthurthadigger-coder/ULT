# ULT 1.0.12 — test source release

Based on the supplied 1.0.11 JUCE8 FIX source archive.

- Guide: 16 expanded bilingual chapters; larger chapter labels; one compact language flag displays the target language; preserves chapter and proportional scroll position when switching; styled panel and accent-coloured headings. Five unchanged supplied screenshots appear between the introduction and parameters in the appropriate chapters.
- Update check: Windows WinHTTP HTTPS GET to the existing Cloudflare version endpoint, HTTP status and JSON validation, five-second per-operation network timeouts, background request, numeric version comparison. Manual failure now shows UNABLE TO CHECK FOR UPDATES for 30 seconds; last diagnostic is in `%APPDATA%\swagghazard\ult\update-last-error.txt`. Existing endpoint/Telegram worker was not changed.
- Factory presets: ten original files byte-for-byte; refresh on the first opening of each new version, restore missing originals, no deletion of installed retired artist presets or user files. Only the ten originals are listed.
- Layout: supplied default.xml is embedded unchanged; first launch of this version applies it globally and uses 1429 x 801; RESET restores the same geometry and accent. Fifth EQ band defaults to HIGH SHELF on new/reset parameters. The supplied XML fifth-band geometry is for HIGH CUT; High Shelf/Bell use calculated four-control positions to avoid overlap. Existing saved parameter values are not rewritten.
- Add Module: flat card surfaces and 15% larger names. Insert bypass icon uses high-quality resampling; parallel Delay/Reverb toggles retain their vector/text design and smoother fractional border placement.
- Social buttons: Windows WinMM asynchronously plays the embedded sound on each click, restarting it if already playing, and opens the URL immediately. The original 24-bit WAV is included as a source asset; a 16-bit PCM copy is embedded for WinMM compatibility. No host audio processing is involved. Non-Windows sound playback is not implemented.

## Validation

Passed: archive/resource checks, standalone C++ compilation of guide text data, Reverb stereo checks at 44.1/48/96 kHz, Touchstone smoke test, Airwindows five-adapter smoke test. The latter emits pre-existing multicharacter literal warnings.

Not validated: full Windows/JUCE/VST3 compilation, actual appearance in FL Studio, WinMM playback and live Cloudflare response. CMake configuration here stopped because there is no JUCE checkout; network lookup here failed DNS. WinHTTP sets five-second timeouts per operation, not a guaranteed five-second total deadline. Test the Windows build before public release.
