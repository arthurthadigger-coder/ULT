# ult v0.6.2 — FL Studio test checklist

## Build and loading
1. Extract to `D:\ult_v06_2`.
2. Run `build-windows.bat`.
3. Confirm the VST3 builds and scans in FL Studio.
4. Open an existing project made with v0.6.1 and verify it restores without crashing.
5. Verify the interface uses the embedded Inter font on a Windows machine where Inter is not installed.

## DSP
6. Insert Gate. Play a signal above threshold, then let it fall below threshold. Confirm the tail closes smoothly and reaches digital silence; adjust Release to change closing time.
7. Insert De-Esser. Sweep Frequency around the vocal's sibilance range, lower Threshold, raise Amount, and confirm S/T/SH sounds are reduced without muting the full vocal.
8. Insert Modulation in Doubler mode. Confirm Original is visible, defaults to 100%, and can be reduced to 0%; confirm it affects only the dry/original component. Switch to Chorus and confirm the Original control is hidden.
9. Test mono input into stereo output with Reverb enabled. Confirm a clearly differentiated left/right wet field. Check mono fold-down for severe cancellation.
10. Test Ping-Pong at Feedback 75%. Confirm repeat sequence is L100, R100, L75, R75, L56, R56, with both channels of each pair matching.
11. Test Ping-Pong at 0%, 50%, and 90% Feedback; verify stability and no runaway feedback.
12. Verify Compressor defaults to Input +18 dB and Output +3 dB on a new instance, after adding Compressor, and after Reset.
13. Load each factory preset and an older user preset. Confirm Compressor values are +18/+3. Save a new user preset and reload it; confirm the agreed normalization still applies.
14. Confirm EQ Low Cut / High Cut Q can be adjusted with the knob and by vertical graph drag.

## DAW workflow
15. Press Spacebar with the plugin editor open. Confirm FL Studio starts/stops playback and no effect Bypass toggles.
16. Press Spacebar while the effect picker is open. Confirm the DAW transport receives it; use Enter to add the highlighted effect.
17. Save a project with a custom chain order and parameter values, close/reopen it, and verify state persistence.
18. Drag effects during playback. Confirm UI cards glide but DSP order changes only on mouse-up.

If FL Studio crashes, send the complete crash log from the FL Studio Support/Logs/Crash folder.
