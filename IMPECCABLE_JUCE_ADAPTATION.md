# Impeccable methodology adapted to ult (JUCE VST3)

The interface is a native JUCE desktop plug-in, not a website or iOS/Android app. Impeccable's official skill does not name JUCE as a supported platform, and the skill's native audit is explicitly scoped to iOS/Android/adaptive apps. The project therefore applies its **Operate** mode and design workflow manually to JUCE, without claiming that the official CLI or native detector ran against the VST3 window.

## Applied workflow

1. **Product context:** preserve the real use scene: a vocal-processing plug-in operated inside FL Studio while monitoring audio.
2. **Pinned visual world:** translate the user's iOS Control Center reference into a monochrome black-glass desktop surface. Do not copy mobile-only status bars or navigation.
3. **Shape/layout:** organize the fixed canvas into Header → Insert Chain → Effect Workspace → Parallel Sends.
4. **Typeset:** embed Inter Regular/SemiBold/Bold and route all JUCE text surfaces through the embedded typeface.
5. **Polish:** use restrained material layering, a consistent knob language, full borders, and purposeful state feedback.
6. **Harden:** preserve the chain's mouse-up-only DSP commit, complete preset recall, and real-time audio safety.
7. **Audit:** inspect accessibility labels/focus, hit areas, timer work, fixed-size geometry, parameter visibility, and state recall.

## Native adaptation boundaries

- The official Impeccable web screenshot/detector cannot inspect a JUCE VST3 editor.
- The official native audit guide is for iOS/Android, so its categories are translated to desktop plugin concerns: keyboard focus, accessibility descriptions, host scaling, window geometry, audio-thread safety, DAW state recall, and redraw cost.
- The shipped VST3 must still be inspected in FL Studio. Source-level review and standalone DSP tests are not visual/runtime sign-off.

## References

- Impeccable project and Operate mode: https://github.com/pbakaus/impeccable
- Impeccable native audit guide: https://github.com/pbakaus/impeccable/blob/main/plugin/skills/impeccable/reference/audit.native.md
- Impeccable craft floor: https://github.com/pbakaus/impeccable/blob/main/plugin/skills/impeccable/reference/craft-floor.md
