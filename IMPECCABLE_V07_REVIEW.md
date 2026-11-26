# ult v0.7.0 — interface and source audit

**Scope:** source-level review of the v0.7.0 JUCE editor and EQ slope implementation. No native Impeccable CLI was run; the audit adapts its critique principles to a desktop VST3.

## Source-level findings

| Dimension | Assessment | Notes |
|---|---|---|
| Visual hierarchy | Improved in source | Header bounds are standardized; labels and numeric values use larger type. Rendered inspection remains pending. |
| Control density | Improved in source | Slider value boxes are visually removed and the value gap is reduced. Dense OTT layout still needs host inspection. |
| State clarity | Improved in source | The preset trigger disables while the popup is active; used effects are visually subdued in the picker. |
| EQ usability | Improved in source | CUT slope is an explicit five-position rotary knob rather than a repurposed Q control. |
| Compatibility | Preserved by design | Existing Q parameters remain; slope parameters default to 24 dB/oct for older states. |
| Performance | No new audio-thread allocations | EQ filter stages are fixed-size arrays; parameter changes update coefficients outside the sample loop. Runtime CPU is unmeasured. |

## Follow-up risks

- `PopupMenu::Options` requests downward placement, but actual behavior must be verified on Windows with the user's display scaling and long user-preset lists.
- The fixed 1320 × 740 window still needs 100%, 125%, 150%, and 200% Windows scaling checks.
- The supplied PNG and the complete header layout need inspection in FL Studio, not just source review.
- Butterworth slope response should be measured in the built plugin and auditioned with real audio. The graph is an analytical approximation to the digital filter response.
- The new EQ stages and schema-8 state require save/reopen and preset compatibility tests.

## Required validation

1. Build with JUCE 9.0.5 and Visual Studio 2026 x64.
2. Scan/load the VST3 in FL Studio 25.
3. Test all five CUT slopes on both outer EQ bands.
4. Confirm the iMan factory preset restores the intended chain and values.
5. Test the preset menu direction and trigger lock.
6. Capture the compiled interface at the fixed shipped size and critique the rendered result.
7. Run the complete regression checklist in `TEST_PLAN_V07.md`.

**Status:** source work prepared; Windows/DAW validation pending.
