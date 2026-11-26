# ULT 0.9.21

- Strict layout import: explicit version, window dimensions, unknown XML tags, empty component lists.
- Import now stages the file and replaces the active layout atomically; failed copies do not corrupt the active layout.
- Layout checkpoint is taken only after successful file replacement.
- Avoid redundant window.xml disk writes during editor relayout.

Not yet complete: full group font scaling, accent palette, real FL Studio build/runtime testing.
