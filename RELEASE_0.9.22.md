# ULT 0.9.22 — development source

Implemented in this iteration:
- Resizing the editor during Layout Edit no longer reapplies saved geometry and destroys unsaved positions.
- Shared layout updates are explicitly applied while another editor is in Edit mode; remote saves win over local unsaved geometry.
- Layout import records undo checkpoint before replacing the active layout, rather than after.
- Layout import rejects missing components rather than silently merging an incomplete XML layout.
- Group resize retains its aspect ratio even if Shift is held during the resize gesture.

Not complete: per-instance accent palette, independent knob value/label editing, full typography scaling, final DSP/visualization QA, Windows VST3/FL Studio validation.

Build validation attempted with CMake; JUCE SDK unavailable in the container, so compilation is not verified.
