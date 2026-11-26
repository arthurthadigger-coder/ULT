# ULT 1.0.13 — test source release

Based on ULT 1.0.12 and the supplied default(2).xml.

- UK flag: corrected 2:1 construction with asymmetric red diagonals and bounded vector paths.
- Bypass: rounded vector stroke paths replace PNG resampling in the insert chain. Delay and Reverb remain text/vector controls.
- Old preset files: UPDATE PRESET replaces the same file with an adapted snapshot; NOT NOW, Escape or closing the notice leaves it unchanged. The snapshot retains the file's own Key/Scale even though loading preserves the session's Key/Scale. Changed files and failed writes produce an error instead of silently reporting success. Old project states have a separate notice and are serialized with the current version on host save.
- All ten factory presets retain their existing parameter values and chain order; added saturation-mode values and version metadata. No installed retired artist presets or user presets are removed.
- New default layout: supplied XML embedded byte-for-byte, 164 components, 1429 x 801, applied once on opening 1.0.13 and used for RESET. Existing guards retain appropriate non-overlapping geometry where supplied controls belong to different effect modes.
- Doubler: shared causal STFT frame clock, opposite pitch ratios, aligned original signal and a stereo delay with shared read indices. Delay adds the requested samples to both wet channels only. Zero detune reconstructs the aligned original. In stereo the lower voice is on L, upper on R; mono output mixes both. The fixed algorithmic latency is 512 samples at 44.1/48 kHz, 1024 at 96 kHz and 2048 at 192 kHz (10.7–11.6 ms). This is reported to the host while the Doubler is active. PDC does not remove live monitoring latency. The actual sound of pitch-shifted transients may differ and needs listening tests. Chorus DSP unchanged.
- Cloudflare API, WinHTTP request and diagnostics retained, except the current version number. 1.0.12 was confirmed working with Incy disabled on the user's computer. No Worker deployment or public release performed.

## Validation

Passed standalone C++ Doubler tests at 44.1/48/96/192 kHz (pitch, unity reconstruction, identical additional delays at 100/200 ms, unaffected aligned original, block-size independence, reset and finite automation). Passed Reverb stereo tests, Touchstone and Airwindows smoke tests, guide data compilation, factory parameter/chain comparison, XML byte comparison and ZIP CRC checks. Airwindows emits existing multicharacter literal warnings.

Not validated: full JUCE/Windows build, actual FL Studio PDC and monitoring behaviour, subjective vocal quality, modal/preset migration with a running plugin, final UI rendering. Test these before publication. No JUCE checkout available in the build environment.
