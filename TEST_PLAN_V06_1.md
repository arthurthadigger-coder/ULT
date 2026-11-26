# ult v0.6.1 — FL Studio test checklist

1. Build from `D:\ult_v06_1` with `build-windows.bat`.
2. Install the new `ult.vst3` to a separate test copy or backup the existing bundle first.
3. Open a blank FL Studio project and instantiate ult. Confirm no wrapper crash.
4. Save the FL Studio project, close it, reopen it, and confirm no state-restore crash.
5. Add Modulation. Confirm no crash. Switch Doubler <-> Chorus several times during playback; verify only the matching controls appear.
6. Add each insert effect. Confirm new effects are ON and the Power button toggles bypass.
7. Select EQ. Set band 1 to LOW CUT and band 5 to HIGH CUT. Confirm Frequency and CUT Q / RESONANCE are visible and adjustable; drag graph points horizontally and vertically.
8. Confirm Delay and Reverb controls are visible immediately, even with an empty insert chain.
9. Confirm the empty-chain title, plus, and helper text do not overlap.
10. Confirm there is no separate Add Effect button; plus buttons open the effect picker.
11. Select each factory preset and confirm chain, parameters, Delay/Reverb states change. Save a user preset and confirm it appears in the same dropdown.
12. Click `ult`, `swagghazard`, and Biohazard; each should open `https://t.me/hazardexcitesme`.
13. Drag cards through several positions during playback. Cards should glide; the audio/DSP order must change only on mouse-up.
14. Test Mono input and Stereo input. Confirm IN/OUT meters respond.
15. Test Ping-Pong Delay and Reverb in stereo.
16. Save/reopen a project with a non-default chain order and parameters.

If FL Studio still crashes, send the exact crash log from:
`%USERPROFILE%\Documents\Image-Line\FL Studio\Support\Logs\Crash`
(or the crash-log path shown by FL Studio).
