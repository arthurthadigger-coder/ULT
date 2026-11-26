# ULT 1.1.0

- Stronger dimming of bypassed effect controls (50% opacity).
- Version metadata updated.

# ULT 1.0.13 (test source)

- Correct 2:1 Union Jack and vector bypass symbol.
- Older presets offer UPDATE PRESET or NOT NOW. Old projects retain a separate compatibility notice and update when saved.
- Updated embedded default layout and factory metadata; original factory parameter values preserved.
- New synchronised stereo Doubler; equal additional delay for both pitch voices, shared dry alignment and DAW latency reporting.
- Existing Cloudflare endpoint unchanged.

# ULT 1.0.1

- Replace embedded factory and RESET LAYOUT geometry with ultlayoutdefault2.xml (137 components).
- Preserve existing custom layouts, window persistence, DSP and renderer.

# ULT 1.0.0

- Embedded supplied layout as factory geometry and reset baseline; default window 1238 x 694.
- Removed biohazard button; legacy layout entries tolerated.
- Enlarged Add Module close glyph without changing button bounds.
- Existing custom layouts and per-instance sizes remain supported. Unspecified module geometry retains previous defaults.

# ULT 0.9.44

- Preserve selected effect on factory and user preset changes; fallback to first chain entry or empty panel.
- Main gain controls use larger default rotary diameter and label bounds; header alignment adjusted. Small layout labels can move and resize independently.
- Alt mouse gestures on layout toolbar suppress button activation. Key 4 toggles EDIT when plugin has keyboard focus; editing keeps toolbar visible; exit hides EDIT.
- Persist per-instance editor dimensions in processor/project state; global window.xml updated only on actual size changes after initialization. Audio presets exclude editor dimensions.
- Existing saved layout coordinates remain authoritative. Software renderer and teardown unchanged.
- Source review only; Windows compilation and host behaviour not verified.
# ULT 0.9.43

- Autotune: KEY, SCALE, VOICE above REFERENCE, RETUNE, HUMANIZE; analyzer remains left.
- Preset popup font +25%, standard row height 26 logical px, scaled with editor.
- Compressor output default and insertion/reset calibration 0 dB; user preset output preserved.
- Delay/Reverb controls lowered 10 logical px; slider height adjusted to fit panel.
- Numeric labels moved 6 logical px closer to knobs.
- Main gain captions and knobs lowered 8 logical px.
- Existing custom layout geometry remains authoritative.
- Software renderer and teardown unchanged from 0.9.42.
- Source changes only; Windows build and visual validation not performed.

## v0.8.2 — software renderer diagnostic

- Attempts to bypass the NVIDIA D3D11 / JUCE Direct2D teardown path seen
  in the user's FL Studio hang dump.
- Switches the editor peer to software renderer 0 upon peer attachment.
- Uses software-backed JUCE images, including the Biohazard asset.
- Updates the Windows build script and CMake JUCE discovery for comp2 (C: only).
- Keeps all audio/DSP and presets from v0.8.1 unchanged.

## v0.8.1 — Non-blocking processor teardown

### FL Studio 25 stability
- Removed the v0.8.0 spin-wait gate around `processBlock()`. Blocking in `releaseResources()` while waiting for an audio callback is unsafe during DAW graph teardown and can leave the host unresponsive.
- `releaseResources()` now only atomically marks the processor inactive; it does not wait and does not destroy DSP handles.
- Removed `AsyncUpdater::triggerAsyncUpdate()` from `processBlock()`: the audio thread now sets an atomic request flag, and a 30 Hz message-thread timer applies host latency changes without posting a message or taking a message-manager lock from realtime code.
- Already-running callbacks can complete with valid DSP objects. New callbacks while inactive clear the output and return.
- Airwindows DSP handles are recreated at the next `prepareToPlay()` and destroyed at final processor destruction.
- Preserves the v0.8.0 EQ two-decimal parameter formatting and revised low-frequency frequency-knob response.

## v0.8.0 — FL Studio teardown safety and EQ frequency control

### Stability
- Added an atomic processing gate that prevents new audio callbacks from entering while DSP resources are being released or recreated.
- `releaseResources()` now waits for already-running `processBlock()` callbacks to exit before destroying Airwindows DSP handles.
- `prepareToPlay()` now uses the same gate during resource reinitialization and only re-enables processing after all resources are ready.
- Audio callbacks received while the processor is inactive safely output silence without accessing DSP resources.

### EQ
- Added two-decimal string conversion at the JUCE parameter level for all five EQ frequency parameters, covering default values, presets, and host parameter readouts.
- Reapplies the two-decimal slider formatter after attachment setup and forces the initial textbox refresh.
- Reworked frequency knob mapping: 20–1000 Hz now moves more gradually, while the existing 1–20 kHz response is retained.

## v0.7.0 follow-up patch

- Align the `ult` and `swagghazard` wordmarks to a shared left edge.
- Display the active preset name in the preset button and append `*` when parameters or the insert chain differ from the loaded snapshot.
- Persist the selected preset name with the plug-in state and tick the selected entry in the preset menu.
- Apply explicit two-decimal formatting to EQ frequency controls after APVTS attachment.
- Replace the embedded factory `iMan` preset with the latest user-supplied state; fill its omitted EQ band-5 slope with the agreed 24 dB/oct default.

# Changelog

## v0.7.0 — Interface refinement, preset menu, and EQ slope controls

### Interface
- Replaced the vector Toxic Biohazard drawing with the user-supplied transparent PNG embedded in BinaryData.
- Increased button, label, menu, meter, and parameter typography.
- Removed visible rectangular backgrounds and outlines from slider value fields.
- Tightened knob/value spacing and refined knob slot spacing.
- Standardized header vertical alignment and meter label/value columns.
- Replaced the ComboBox preset selector with a dedicated PRESETS button and a custom popup menu.
- The PRESETS trigger is disabled for the lifetime of the popup; popup placement prefers downward opening.
- Existing effects in the add-effect picker are darker and lower-contrast; unused effects are more prominent.

### Presets
- Embedded the user's iMan.ultpreset as a factory preset, without requiring a separate user preset file.
- Existing user presets continue to load from the user's application-data Presets folder.

### EQ
- Added eqSlope1 and eqSlope5 choice parameters: 12, 18, 24, 36, and 48 dB/oct.
- Added first-order and cascaded Butterworth filter sections for true 2nd-, 3rd-, 4th-, 6th-, and 8th-order cut slopes.
- In CUT mode, the SLOPE rotary knob replaces Q for outer bands 1 and 5.
- The graph now reflects the selected slope; dragging a CUT node changes cutoff frequency only.
- EQ frequency values are formatted to two decimal places.

### Compatibility
- Existing eqQ1/eqQ5 parameters are retained for backward compatibility and for non-CUT filter modes.
- New slope parameters default to 24 dB/oct when loading older states that do not contain them.
- State schema marker advanced to version 8.

## v0.6.3 — Monochrome Glass redesign and stereo reverb
- Reorganized the fixed-size editor while keeping the window non-resizable.
- Rebuilt the header, insert-chain, effect-workspace, and parallel-send layout.
- Replaced the previous mixed charcoal/blue treatment with monochrome black, graphite, and white glass surfaces.
- Embedded Inter Regular, SemiBold, and Bold.
- Replaced the previous reverb with an original stereo algorithm combining asymmetric input diffusion, an 8-line orthogonal FDN, early reflections, and independent output diffusion.
- Preset recall refreshes the insert-chain view after rebuilding the effect panel.
- Chain DSP order still commits only on mouse-up.
