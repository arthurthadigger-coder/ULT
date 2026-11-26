# ULT 0.9.44

- Preserve selected effect on factory and user preset changes; fallback to first chain entry or empty panel.
- Main gain controls use larger default rotary diameter and label bounds; header alignment adjusted. Small layout labels can move and resize independently.
- Alt mouse gestures on layout toolbar suppress button activation. Key 4 toggles EDIT when plugin has keyboard focus; editing keeps toolbar visible; exit hides EDIT.
- Persist per-instance editor dimensions in processor/project state; global window.xml updated only on actual size changes after initialization. Audio presets exclude editor dimensions.
- Existing saved layout coordinates remain authoritative. Software renderer and teardown unchanged.
- Source review only; Windows compilation and host behaviour not verified.
