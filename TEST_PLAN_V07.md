# ult v0.7.0 validation plan

## Build and host
- [ ] Extract to `D:\ult_v0.7.0`.
- [ ] Build `ult_VST3` with JUCE 9.0.5 and Visual Studio 2026 x64.
- [ ] Confirm the VST3 appears at `D:\ult\build_v0.7.0\ult_artefacts\Release\VST3\ult.vst3`.
- [ ] Scan, open, and play the plugin in FL Studio 25.
- [ ] Confirm the editor remains 1320 × 740 and non-resizable.
- [ ] Inspect at Windows scaling 100%, 125%, 150%, and 200%.

## Header and interface
- [ ] Verify the Biohazard PNG is sharp, correctly scaled, and transparent over the UI.
- [ ] Verify input/output controls, meter, PRESETS, SAVE PRESET, and Biohazard are vertically aligned.
- [ ] Verify IN/OUT labels and dB values share consistent baselines and columns.
- [ ] Verify slider values have no rectangular background or outline.
- [ ] Verify parameter labels and values are readable without clipping.
- [ ] Verify reduced knob/value spacing remains comfortable for mouse operation.
- [ ] Verify used effects are subdued and unused effects are prominent in ADD MODULE.

## Presets
- [ ] Open PRESETS; confirm the popup opens below the button.
- [ ] Confirm PRESETS is disabled while the popup is open and re-enabled after selection or dismissal.
- [ ] Load each existing factory preset.
- [ ] Load iMan from FACTORY; verify its chain and parameters are restored on first selection.
- [ ] Save and reload a user preset.
- [ ] Load a v0.6.3 preset and verify missing slope parameters default to 24 dB/oct.
- [ ] Save project, close FL Studio, reopen, and verify plugin state.

## EQ
- [ ] In band 1 LOW CUT, verify the SLOPE knob offers 12/18/24/36/48 dB/oct and defaults to 24.
- [ ] Repeat for band 5 HIGH CUT.
- [ ] Confirm Q is absent in CUT mode and returns in SHELF/BELL modes.
- [ ] Verify each slope produces approximately its named attenuation per octave away from cutoff.
- [ ] Verify dragging CUT nodes changes frequency only; SLOPE remains controlled by its rotary knob.
- [ ] Verify frequency readouts show exactly two digits after the decimal point.
- [ ] Verify EQ state survives preset and DAW project save/reopen.

## Regression
- [ ] Test Gate, Autotune, Octave Shifter, EQ, Compressor, De-Esser, Saturator, OTT, and Modulation.
- [ ] Test Doubler/Chorus mode switching and bypass.
- [ ] Test stereo Ping-Pong Delay and Room/Hall/Space Reverb.
- [ ] Confirm Delay and Reverb remain visible regardless of insert chain.
- [ ] Confirm insert-chain drag changes DSP order only on mouse-up.
- [ ] Listen for clicks, pops, filter instability, and CPU spikes during parameter changes.

The JUCE SDK and Windows toolchain are not present in the source-preparation environment. This plan remains pending until executed on the target Windows/FL Studio system.
