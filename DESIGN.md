---
name: ult Monochrome Glass
mode: Operate
platform: Native desktop JUCE VST3
---

# Visual direction

**Creative North Star: night glass, translated from iOS Control Center into a desktop audio instrument.** The user works inside a DAW while listening to a live vocal signal. The interface must be immediately scannable, calm under pressure, and precise enough for parameter work. The iOS reference contributes its black glass surfaces, soft edge reflections, rounded geometry, and strict monochrome contrast; it does not contribute mobile navigation, status bars, or touch-only conventions.

## Non-negotiable constraints

- One dark monochrome appearance only: black, charcoal, white, and neutral gray. No cyan, blue, green, or warm accent colors.
- Inter is the only typeface. Inter Regular, SemiBold, and Bold are embedded in the VST3; users do not install anything.
- Fixed editor size: **1320 × 740 logical pixels**, non-resizable. The composition must keep the header, insert chain, selected-effect workspace, and parallel sends visible together.
- Preserve all existing product functions and parameter mappings. Redesign the surface, not the DSP contract or project-state format without migration.
- No static image controls, no web UI, no live blur, no expensive visual effects in the audio callback.

## Monochrome tokens

| Token | Value | Use |
|---|---|---|
| Canvas | `#050505` | Main editor background |
| Panel | `#101010` | Main panel body |
| Panel top | `#292929` | Upper glass reflection |
| Raised surface | `#202020` | Cards, selectors and control beds |
| Primary text | `#F7F7F7` | Titles, values, active controls |
| Secondary text | `#B0B0B0` | Labels and supporting copy |
| Border | `#88FFFFFF` | Full panel outlines |
| Soft border | `#38FFFFFF` | Dividers and inactive edges |
| Active | `#FAFAFA` | Selected/ON state |

Use neutral grayscale to communicate state. Never make green/red/blue the only indication of enabled, bypassed, selected, or warning status.

## Typography

- Inter Bold: wordmark and primary module headings.
- Inter SemiBold: control labels, buttons, values, section headings.
- Inter Regular: descriptions and supporting text.
- Numeric values use consistent alignment and readable sizes. Avoid tiny all-caps labels where the control itself can carry context.

## Composition

A fixed 1320 × 740 surface uses four persistent zones:

1. **Header (0–88 px):** brand and signature, Input/Output gain, IN/OUT meters, combined factory/user preset selector, Save Preset, Biohazard link.
2. **Insert chain (116–206 px):** centered module cards with clear drag grip, selected state, ON/BYPASS state, remove action, and insertion plus controls. An empty chain teaches the first action without overlapping it.
3. **Effect workspace (234–532 px):** selected module title and its controls. EQ receives a large graph and a separate compact parameter rail. OTT uses a 6-column × 2-row layout so all twelve controls retain generous knob size.
4. **Parallel sends (560–726 px):** Delay and Reverb remain visible in two equal columns with their own power controls and parameters.

Spacing uses an 8 px rhythm, with 12–20 px between task zones. Panels have 18–20 px radii; controls use 8–13 px radii. Keep the chain cards and control surfaces visually distinct without nesting decorative cards inside cards.

## Material and controls

- Main panels use a restrained dark vertical gradient, one soft top reflection, a complete thin border, and a subtle inner rim.
- Rotary controls use a matte graphite face, a clean white value arc, a single white pointer, and a soft contact shadow. No excessive tick marks or neon glow.
- Power controls show both an icon and a textual ON/BYPASS state.
- Combo boxes and buttons share the same graphite material and border language.
- Icons are drawn as consistent vector artwork or simple typographic abbreviations; do not use emoji as UI icons.
- Motion is short and state-driven. Chain cards animate visually while dragging, but the DSP order is committed once on mouse-up.

## Interaction and state

- The effect picker opens from a plus in the chain. It shows the complete effect list immediately, with no search field and no category tabs.
- Newly inserted modules are enabled by default.
- Duplicate effect types remain marked as IN CHAIN and focus the existing instance.
- Drag reorder changes only the visual preview until mouse-up.
- Presets share one dropdown for factory and user presets. Save remains a separate action; there is no Load button.
- Preset and project recall must restore chain membership, exact order, parameter values, bypass states, and parallel-send values.
- Delay and Reverb are always visible and independent of the insert chain.

## Quality bar

- Every visible control has a real action, readable state, and tooltip/description where useful.
- Inter is used by all labels, buttons, combo boxes, popups, and slider text boxes.
- Contrast remains strong in the monochrome palette.
- The fixed layout does not clip at its shipped dimensions.
- No GUI allocation, blocking lock, or memory allocation is introduced into the audio callback.
- Verify the actual VST3 render in FL Studio at 100%, 125%, 150%, and 200% Windows scaling before release.
