# ULT 0.9.18
- Strict layout XML validation before import: unknown/duplicate IDs, invalid geometry, bounds and excessive entries rejected.
- Layout import and reset create one undo checkpoint in the existing editor history.
- Saved layout is written through a temporary file and replaced atomically.
- Leaving edit mode clears selection and restores saved layout geometry.
- CMake version bumped to 0.9.18.

Not implemented: global instance synchronization, fully finished Layout Editor, all DSP visual polish.
Windows VST3 compilation not tested.
