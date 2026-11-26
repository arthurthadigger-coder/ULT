⚠️ DEGRADED: single-context (JUCE desktop VST3 is outside Impeccable's supported web/iOS/Android targets; no JUCE detector or separate review agent is available in this environment).

# ult v0.6 — Impeccable-informed source review

This is a source-level review of the v0.6 implementation, not a rendered FL Studio critique. The official Impeccable workflow separates product truth, visual system, task hierarchy, critique, audit, and optimization. Those principles are adapted in `PRODUCT.md`, `DESIGN.md`, and `IMPECCABLE_JUCE_ADAPTATION.md`. No browser detector, native iOS/Android audit, or FL Studio screenshot inspection is claimed.

## Provisional score (source-only)

| Dimension | Score | Evidence / limitation |
|---|---:|---|
| Accessibility & input | 2/4 | Chain and effect picker have keyboard paths; custom-drawn chain cards still need a true accessibility tree and host-level keyboard verification. |
| Performance | 3/4 | No blur-heavy rendering; chain refresh is revision-driven; meter updates at 30 Hz; EQ graph repaints only while visible. No runtime CPU/frame measurement yet. |
| Appearance & theming | 3/4 | Centralized graphite tokens, custom rotary/button/combo painting, restrained gradients and explicit ON/BYPASS labels. Actual font fallback and host rendering remain unverified. |
| Layout & hierarchy | 3/4 | Persistent header → chain → selected effect → parallel sends; OTT has a 4×3 control grid; fixed 1280×820 size has not been checked at high DPI or small host windows. |
| Implementation quality | 2/4 | CMake configures with a mock JUCE package and source paths exist, but actual JUCE 9.0.5 compilation and DAW runtime are pending. |
| **Total** | **13/20** | **Provisional only; do not compare to a runtime audit score.** |

## Findings and follow-up

### P1 — Must verify before calling v0.6 stable

1. **JUCE/Windows compile:** compile against the user's actual JUCE 9.0.5 and Visual Studio 2026. The editor uses custom LookAndFeel overrides and SafePointer callbacks; API and linker compatibility must be proven by the real build.
2. **Ping-Pong audio:** verify that a mono send produces first echo left, second right, then alternates, with feedback decay and no unexpected dry widening.
3. **Stereo reverb:** verify mono input produces a perceptibly wider wet field, stereo input preserves its image, and mono fold-down does not produce unacceptable cancellation. The two all-pass stages are deliberately mild; listen and tune after measurement.
4. **State migration:** load a v0.5 FL Studio project containing Modulation, Phaser, Quality, and Resonance settings. Confirm Phaser maps safely to Doubler, Chorus remains Chorus, old Resonance is removed, and the full chain/parameter/bypass state survives save/reopen.
5. **Preset round-trip:** save a custom preset, change chain and parameters, reload, and verify exact restoration.

### P2 — Improve after the first runtime pass

1. Add a JUCE accessibility handler or equivalent accessible descriptions for custom chain cards and effect-picker choices. Keyboard support is present but does not replace screen-reader semantics.
2. Check the fixed 1280×820 editor at 100%, 125%, 150%, and 200% Windows scaling and inside FL Studio's plugin wrapper.
3. Verify the biohazard glyph resolves on a clean Windows 11 install; if not, replace the glyph with a custom vector path.
4. Review the visual weight of OTT knobs and send controls from a fresh screenshot.
5. Measure UI CPU/repaint cost and audio-thread CPU at 44.1/48/96 kHz with small buffers.

## Design decisions carried through

- One dark graphite theme only; no light theme.
- No search/category controls in the effect picker.
- New insert effects start enabled.
- Resonance Control is removed; its enum slot is reserved only for old-chain compatibility.
- Modulation has Doubler and Chorus only; Power is the bypass.
- Saturator voicings are Triode / Pentode / Tape.
- EQ edges support Cut / Shelf / Bell, with Q as the vertical gesture in Cut mode.
- Delay and Reverb are always visible parallel sends.
- LIVE is the only processing mode.
- One preset dropdown; Save remains, Load button is removed; factory presets are a future addition to the same list.
- The chain's DSP order changes once after mouse-up, never during pointer movement.
