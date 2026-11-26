# ULT 0.9.16

- Added a live parameter-linked 1176 transfer-characteristic overlay: actual fixed -18 dB threshold, hard knee, Input drive, Output makeup, and selectable 4:1/8:1/20:1 ratio.
- Bypass shows the unity line prominently and the compressor curve dimmed.
- The existing five-second input/output history and IN/OUT/GR meters remain.
- No new audio parameters or changes to parameter IDs.

Remaining: accurate detector-derived gain reduction (currently stage peak delta), layout editor completeness, global layout sync, additional validation and Windows VST3 build.

Note: transfer curve is a static ideal characteristic, not a simulation of time-dependent attack/release.
