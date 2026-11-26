# Third-party source patches and integration notes

This file records modifications made when adapting upstream DSP into ult.

## SnapTune (AGPLv3)

Files: `Sources/ThirdParty/SnapTune/AutoTuneEngine.h/.cpp`

- Added `EngineSettings::transposeSemitones` for the octave voices.
- LIVE is the only exposed and used mode in v0.6. The upstream low-latency delay-line mode is selected for pitch correction and both octave voices.
- The Octave Shifter uses two separate SnapTune engine instances with scale correction disabled and fixed offsets of -12 and +12 semitones.
- The old v0.5 Quality setting is ignored during project-state migration.

## Airwindows (MIT)

- `StereoDoubler`: the original DSP exposes a third `Delay` parameter. Its delay buffer was expanded and detune mapping calibrated for the requested +/-50-cent range. The original DSP process remains the basis of the effect.
- `DeBess`: the original DeBess processor is retained. ult adds a pre-filter whose cutoff is controlled by Frequency and maps Threshold to the DeBess intensity control. Other DeBess controls are fixed to vocal defaults.
- `Density3`: the original DSP is retained. Drive maps to Density, Character maps to the high-pass character control, and ult applies the Mix blend. Triode / Pentode / Tape are musical voicings over Density3 parameter mapping, not component-level circuit simulations.
- `StereoChorus`: the original DSP is retained. The single Character knob maps to speed and depth controls; ult applies a parallel send.
- `Verbity`: the original stereo DSP is retained. Room/Hall/Space map to size, Decay maps to Verbity Longness, Character maps to Darkness, and ult applies a parallel send plus envelope-based Smart Ducking. v0.6 adds two mild per-channel all-pass stages to the wet input to decorrelate mono sources and improve stereo width without adding sample latency.

## Faust xfer_ott (function-level MIT declaration)

- The xfer_ott source function is retained as a reference in `Sources/ThirdParty/Faust/xfer_ott.faust`.
- `Sources/DSP/FaustOtt.cpp` is a C++ adaptation of its per-band transfer curves, attack/release timing, depth/time interpolation, threshold shifts and makeup behaviour. The three-way crossover uses JUCE Linkwitz-Riley filters.
- This is an algorithmic adaptation, not a bit-identical Faust-generated implementation. The OTT module still needs listening and null/response tests.

## TOUCHSTONE-LA-8 (AGPLv3)

- The upstream `refcomp` DSP headers are used directly.
- ult selects the FET topology, sets fast fixed attack/release, and maps user controls to Input, Output and 4:1 / 8:1 / 20:1 ratios.

## ult-owned DSP and application code

- Gate / Expander, EQ, BPM Delay, Ping-Pong cross-feedback, Smart Reverb Ducking, reverb input decorrelation, parameter mapping, state persistence, chain management and GUI code are implemented in the ult project itself.
- Resonance Control is removed from v0.6. Its numeric effect slot is reserved only to read and discard old v0.5 chain entries safely.
- Modulation uses Doubler and Chorus only. Phaser and Off are removed; Power handles bypass.
- Delay and Reverb remain fixed parallel sends and are always visible in the editor.

## MSVC C3861 / C2039: `setTooltip` on custom `juce::Component` subclasses

Removed unsupported calls from `AddEffectOverlay`, `ChainView`, and `MeterView`. Their `setTitle` / `setDescription` accessibility metadata remains. Tooltip calls on `juce::Button`, `juce::Slider`, and `juce::ComboBox` remain because those controls support tooltips.
