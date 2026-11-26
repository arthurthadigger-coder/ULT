# ult v0.6.3 — Impeccable-inspired source audit

**Scope:** static review of the v0.6.3 JUCE source after the monochrome-glass redesign and the new original stereo reverb. The audit adapts Impeccable's Operate-mode critique and audit principles to a desktop VST3. No Impeccable CLI/native detector was run; its official native audit is for iOS/Android, not JUCE.

## Audit health score (source-level, provisional)

| Dimension | Score | Finding |
|---|---:|---|
| Accessibility & state clarity | 2/4 | Tooltips/descriptions and keyboard handling exist in parts of the chain/picker, but custom-painted card actions are not exposed as individual accessible child controls. |
| Performance | 3/4 | Reverb memory is allocated in `prepare()`, the sample callback remains allocation-free, and the UI uses its existing 30 Hz timer. Runtime CPU and repaint cost remain unmeasured. |
| Appearance & theming | 3/4 | A single monochrome token set, embedded Inter family, custom rotary treatment, and layered glass panels are implemented in source. Rendered appearance still needs host inspection. |
| Desktop layout & adaptivity | 3/4 | The editor is fixed at 1320 × 740 and the four working zones remain visible by construction. Host DPI scaling and smaller usable work areas still need testing. |
| Implementation integrity | 3/4 | Preset loads force a fresh chain snapshot after parameter-panel rebuild; reverb has a standalone mono-to-stereo test. Windows build and DAW behavior are not yet verified. |
| **Total** | **14/20** | **Good — release validation is still required.** |

## P1 — Runtime validation is not complete

- **Location:** whole project / Windows JUCE build and FL Studio host.
- **Impact:** source correctness does not prove that the VST3 scans, loads, restores state, or behaves correctly under live playback.
- **Recommendation:** build with the user's JUCE 9.0.5 and Visual Studio 2026 toolchain; test every effect, preset switching, project save/reopen, and transport behavior.

## P1 — Accessibility of custom chain controls is partial

- **Location:** `Sources/PluginEditor.cpp`, `ChainView::paint`, `mouseDown`, `keyPressed`.
- **Impact:** effect cards are painted as a single component; assistive technology cannot independently discover every remove/power/add action.
- **Recommendation:** add explicit accessible actions or child components in a later hardening pass without changing the mouse-up-only DSP order commit.

## P2 — Fixed-size host fit needs real display testing

- **Location:** `Sources/PluginEditor.cpp`, editor constructor and `resized()`.
- **Impact:** the fixed 1320 × 740 design is intentional, but Windows display scaling and DAW workspace constraints may affect the usable area.
- **Recommendation:** test at 100%, 125%, 150%, and 200% scaling and on 1366 × 768 and 1920 × 1080 displays. Do not make the window resizable; adjust the single fixed design only if clipping is observed.

## P2 — Reverb requires listening validation

- **Location:** `Sources/DSP/UltReverb.cpp` and `processReverbSend()`.
- **Evidence:** standalone mono impulse tests at 48 kHz produced left/right energies in all three voicings, side-energy ratios of approximately 0.496–0.501, and L/R correlation values near zero. Peak output remained below 0.21 for a unit impulse.
- **Impact:** these checks demonstrate a wide, decorrelated stereo output in the test harness, but not the subjective quality of a vocal reverb in FL Studio.
- **Recommendation:** audition Room, Hall, and Space modes with mono vocals, stereo vocals, short transients, sustained pads, and long tails. Check decay stability at multiple sample rates.

## Positive findings

- Inter Regular, SemiBold, and Bold are bundled and used through the custom JUCE LookAndFeel; no user font installation is required.
- The editor has a single monochrome palette, a fixed 1320 × 740 layout, and a 6 × 2 OTT grid to preserve useful knob size.
- The effect chain still commits its DSP order only after mouse-up.
- Preset recall explicitly refreshes the chain after selecting/rebuilding the effect panel.
- The new reverb uses only original code, preallocates delay/diffuser memory in `prepare()`, and does not allocate in `processSample()`.
- Existing factory/user preset, delay, gate, compressor, EQ, modulation, and insert-chain behavior is preserved in the source.

## Required next checks

1. Windows build using `build-windows.bat`.
2. FL Studio scan/load and fresh-instance test.
3. Factory preset switch: verify chain appears on the first selection.
4. User preset save/load and DAW project close/reopen round trip.
5. Reverb mono/stereo listening test in Room/Hall/Space.
6. Check Delay ping-pong sequence and all earlier v0.6.2 DSP decisions.
7. Capture a current FL Studio screenshot at the fixed shipped size and perform the final visual critique.
