# Product

<!-- impeccable:product-schema 1 -->

## Platform

Native desktop audio plug-in: Windows VST3 built with C++17 and JUCE 9.0.5. This platform is outside Impeccable's current web/iOS/Android platform enum; this record names the real target rather than misclassifying it.

## Users

A musician, vocalist, or producer recording and monitoring vocals in a DAW, initially FL Studio on Windows.

## Product Purpose

ult by swagghazard is an all-in-one vocal-processing VST3 focused on high-quality vocal tone and low-latency live recording. Users assemble an insert chain, control parallel delay and reverb sends, and save complete project state.

## Positioning

A user-configurable vocal chain with freely reorderable insert effects, independent parallel send effects, and a recording-first low-latency workflow.

## Operating Context

The plug-in is opened inside a DAW during recording, playback, and mixing. Controls must remain legible at a glance, operate reliably while audio is running, and avoid blocking or expensive work on the audio thread.

## Capabilities and Constraints

- Windows 11 x64, VST3, C++17, JUCE 9.0.5, CMake, Visual Studio 2026.
- Insert chain starts empty; effects are added from a picker and are enabled when added.
- Dragging changes only the visual preview; DSP order is published once after mouse-up.
- Delay and Reverb are fixed parallel sends and remain visible.
- Full project recall includes effect membership, order, parameter values, bypass states, and send settings.
- LIVE is the only monitoring mode. Low latency and real-time safety take priority over decorative UI effects.
- Factory and user presets share the PRESETS dropdown menu; the menu opens downward, and user presets are stored in a single flat preset list. The iMan sound is embedded as a factory preset.
- Mono and stereo input/output layouts are supported subject to the processor's bus-layout rules.

## Brand Commitments

Product name: ult. Signature: by swagghazard. The only UI theme is strict monochrome black/graphite/white, inspired by iOS Control Center glass and translated to a native desktop audio workspace. Inter is embedded and used throughout. The editor is fixed at 1320 × 740 and is not resizable. A Toxic Biohazard shortcut opens https://t.me/hazardexcitesme.

## Evidence on Hand

The v0.6.3 JUCE source project, its third-party DSP source integrations, the user's FL Studio screenshots, the user's explicit v0.7 interface/EQ decisions, the embedded iMan preset, and source-level audits. Runtime screenshots and DAW test evidence for v0.7.0 do not yet exist.

## Product Principles

1. Sound quality and natural vocal character come before decoration.
2. LIVE monitoring stays responsive and predictable.
3. Every visible control must do real work and expose its state clearly.
4. The audio thread must never wait for UI work or allocate unnecessarily.
5. Projects reopen exactly as the user saved them.
