# Impeccable-inspired review — ult v0.6.1

This review applies Impeccable's product/design critique principles to the native JUCE editor. It does not claim to run Impeccable's browser-specific automated tooling against a VST3 window.

## Product and interaction decisions

- One obvious add affordance: plus controls inside the chain. The duplicate top-right Add Effect button is removed.
- Empty state uses a clear hierarchy: title, plus action, helper text, with no overlap.
- Insert cards keep the existing safety contract: visual positions animate during drag, but DSP order is committed only on mouse-up.
- Power state is conveyed by a refined ring indicator and ON/BYPASS text, not color alone.
- `ult`, `swagghazard`, and Biohazard all expose the same explicit Telegram action.
- Factory and user presets share one dropdown; the built-in and user entries are grouped within the same control, not split into separate folders.

## Visual language

- Dark-only Liquid Graphite palette with cooler blue highlights.
- Layered panel gradients, restrained specular edge strokes, soft background glows, and rounded glass-like surfaces.
- Controls remain native interactive JUCE components; the interface is not a bitmap or generated mockup.
- No continuous blur effect is simulated because a JUCE plugin editor should avoid expensive full-window blur work during recording.

## Usability and robustness

- Delay and Reverb controls receive a final layout pass after construction.
- The initial effect panel gets a useful empty-selection title.
- Low/High Cut retains an editable Slope/Q control and graph vertical drag maps to the cut filter's Q parameter.
- Chain card movement is eased at the UI layer; the audio chain snapshot is unchanged until mouse-up.
- State loading validates the APVTS root and input bounds before replacing parameter state.

## Performance guardrails

- No timer-driven audio DSP work is added.
- Card animation runs on the editor timer only.
- Existing 30 Hz editor timer is reused; no new timer is created.
- The existing real-time DSP chain publication model remains unchanged.

## Known verification gap

Visual inspection and interactive testing still need to happen in FL Studio on the user's Windows machine at normal and high-DPI scaling. The editor source is updated, but this review is not a substitute for the actual JUCE/Visual Studio build and DAW test.
