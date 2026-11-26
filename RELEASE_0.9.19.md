# ULT 0.9.19

- Added shared layout change detection at the editor timer (file existence, modification time and length).
- Other open ULT editors reload component geometry when the global layout is saved, imported or reset.
- Existing editor window dimensions are preserved during remote layout updates.
- Remote changes clear local component selection and replace unsaved geometry.
- Saving, importing and resetting update the local observed file signature to avoid redundant reloads.
- Audio parameters and DSP are not touched by layout synchronisation.

Limitations: change detection is polling-based (60 Hz while editor is open), and cannot detect a same-timestamp same-size overwrite. Full accent/theme sharing, independent window-size persistence, group transforms and Windows VST3 compilation are not complete.
