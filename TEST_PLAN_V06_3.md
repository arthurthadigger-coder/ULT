# ult v0.6.3 validation plan

## Build and load
- [ ] Extract to `D:\\ult_v0.6.3`.
- [ ] Confirm JUCE 9.0.5 at `D:\\JUCE`.
- [ ] Run `build-windows.bat` and confirm `ult.vst3` exists.
- [ ] Scan/load in FL Studio 64-bit; verify no crash on first load and on project reopen.

## Fixed editor / visual
- [ ] Confirm the editor is exactly 1320 × 740 logical pixels and cannot be resized.
- [ ] Inspect the full header, insert chain, selected-effect panel, Delay, and Reverb simultaneously.
- [ ] Inspect at Windows scaling 100%, 125%, 150%, and 200%; no clipping or inaccessible controls.
- [ ] Verify all text, popup menus, combo boxes, labels, and slider value boxes use embedded Inter.
- [ ] Confirm only grayscale UI colors are used; ON/BYPASS remains readable without relying on color.
- [ ] Confirm `ult`, `swagghazard`, and Biohazard open the correct Telegram URL.

## Insert chain and presets
- [ ] New instance opens with an empty chain and centered plus action.
- [ ] Plus opens the complete picker; no search field or category tabs.
- [ ] Newly added effect is enabled.
- [ ] Existing effect types are marked IN CHAIN and focus the existing instance.
- [ ] Remove, bypass, select, and drag actions work.
- [ ] During drag, cards animate smoothly; DSP order changes only on mouse-up.
- [ ] First factory preset selection immediately displays the correct chain.
- [ ] Switching between every factory preset immediately refreshes the chain and effect controls.
- [ ] Save/load user preset restores order and parameters; compressor Input/Output normalize to +18/+3 dB.
- [ ] Save project, close FL Studio, reopen project; verify exact chain, bypass, parameters, and sends.

## DSP regression
- [ ] Reverb mono input: audition Room, Hall, and Space; confirm wide stereo field without a Width knob.
- [ ] Reverb stereo input: confirm the original stereo image remains coherent and does not collapse.
- [ ] Check reverb tail stability at 44.1, 48, and 96 kHz and at short/long decay settings.
- [ ] Delay Ping-Pong at 75% Feedback: verify L100, R100, L75, R75, L56, R56, then progressive decay.
- [ ] Compressor newly added/default/factory/user preset: Input +18 dB, Output +3 dB.
- [ ] EQ bands 1 and 5: Cut vertical drag changes Q/Slope; frequency remains horizontal.
- [ ] De-Esser: audition sibilant vocals and verify amount control is clearly audible without lisping.
- [ ] Doubler: Original control ranges 0–100%, default 100%.
- [ ] Gate: below threshold, attenuation reaches silence after release.
- [ ] Modulation: Doubler/Chorus only; switch modes and verify only relevant controls appear; test bypass.
- [ ] Spacebar starts/stops FL Studio transport and does not toggle plugin bypass.
- [ ] Delay and Reverb remain visible and independent of insert-chain membership.

## Standalone DSP test
From the project root:

```bash
g++ -std=c++17 -O2 Tests/ReverbStereoTest.cpp Sources/DSP/UltReverb.cpp -o reverb_stereo_test
./reverb_stereo_test
```
