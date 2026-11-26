# ult v0.8.2 — diagnostic build for FL Studio 25 hang

This test variant is based on v0.8.1. Its purpose is to isolate GPU-backed
JUCE window teardown from the plug-in's audio DSP.

## Evidence from the supplied FLStudio_Hang.dmp

- Windows mini dump captured on 22 Nov 2026, approx. 60 MB.
- 56 threads and 148 modules; ult.vst3 was loaded from the normal system VST3 path.
- The main thread (TID 1268) was waiting in ntdll/KERNELBASE.
- Its saved stack contains NVIDIA user-mode driver (nvwgf2umx.dll), d3d11.dll,
  and ult.vst3 frame addresses in adjacent sections of the stack.
- This is stack-address evidence rather than a full symbolized debugger unwind.
  The exact function or GPU API causing the wait cannot be confirmed yet.

## Diagnostic changes

1. `UltAudioProcessorEditor::parentHierarchyChanged()` selects JUCE's
   software renderer (engine 0) once a window peer exists.
2. Compile-time `JUCE_USE_SOFTWARE_IMAGE_TYPE=1` makes default image storage
   CPU-backed, and the embedded Biohazard image is explicitly converted.
3. The DSP engine, APVTS parameter layout, EQ controls and iMan factory preset
   remain unchanged from v0.8.1.
4. Build paths are compatible with comp2 (drive C: only).

## Build on comp2

- Unzip as C:\ult_v0.8.2 and run build-windows.bat.
- Place JUCE at C:\JUCE, or configure JUCE_PATH to the actual JUCE folder
  before launching the batch file.
- Expected build artifact:
  C:\ult_v0.8.2\build\ult_artefacts\Release\VST3\ult.vst3
- Install/replace the old plugin only while FL Studio is closed.

## Important

This is an unverified diagnostic source build. No Windows JUCE toolchain or
FL Studio host is available here. If the hang persists, collect a new mini
dump after confirming the host is using the new build; inspect it with WinDbg
or send its text stack output for symbolized analysis.
