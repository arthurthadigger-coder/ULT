# ult v0.6 — FL Studio verification plan

Run after a successful Windows build. Keep v0.5 installed until the v0.6 tests pass.

## Build and load

- [ ] Run `build-windows.bat` from `D:\ult_v06`.
- [ ] Confirm `D:\ult\build_v0.6\ult_artefacts\Release\VST3\ult.vst3` exists.
- [ ] Install/copy the VST3 to the standard VST3 folder and rescan in FL Studio.
- [ ] Open ult; confirm the editor opens without a crash and all panels render.

## UI and workflow

- [ ] The effect picker has no search field and no category tabs; all effect types are shown. Existing types are marked IN CHAIN and selecting one focuses its current card (duplicate instances are not supported yet).
- [ ] Add each insert effect; each newly added effect shows ON and processes audio.
- [ ] Power toggles bypass and restores the same settings.
- [ ] Drag a card while playback is running: only the visual order changes during the drag; DSP order changes once on mouse-up.
- [ ] Verify the chain can be navigated with keyboard: Space toggles, Delete removes, Left/Right reorders.
- [ ] Modulation has only Doubler and Chorus; mode-specific controls switch and Phaser/Off are absent.
- [ ] OTT controls are legible and larger than v0.5.
- [ ] Delay and Reverb are visible even when the insert chain is empty.
- [ ] EQ points 1 and 5 can be dragged in Cut, Shelf, and Bell; Cut vertical drag changes Q/slope, Shelf/Bell vertical drag changes gain.
- [ ] Saturator shows Triode / Pentode / Tape and retains Drive, Mix, Character.
- [ ] Presets appear in one dropdown; Save works; there is no Load Preset button.
- [ ] Biohazard button opens https://t.me/hazardexcitesme.

## Audio checks

- [ ] IN meter responds to the input signal before Input Gain; OUT meter responds after Output Gain. Peak-hold markers decay smoothly.
- [ ] Ping-Pong with mono input: first repeat left, second right, then alternate. Standard mode remains conventional dual-mono/stereo delay.
- [ ] Reverb with mono input creates a stereo wet field; stereo input remains stereo; listen to mono fold-down for excessive cancellation.
- [ ] Reverb Smart Ducking still reduces the tail while the dry vocal is present.
- [ ] LIVE autotune and Octave Shifter remain low-latency; no Quality selector exists.
- [ ] Check CPU and audio stability at 44.1, 48, and 96 kHz with 32/64/128 sample buffers where supported.

## Project and preset recall

- [ ] Load a v0.5 project with Phaser/Resonance/Quality settings; confirm safe migration.
- [ ] Save a v0.6 project with a custom effect order, non-default values, and mixed bypass states. Close and reopen FL Studio; confirm exact restoration.
- [ ] Save a user preset, alter the chain, reload the preset from the dropdown, and confirm exact restoration.
