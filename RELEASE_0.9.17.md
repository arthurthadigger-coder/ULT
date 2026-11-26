# ULT 0.9.17

- Compressor 1176: GR meter now reads actual per-sample detector reduction from refcomp::Engine::setGrTap(), rather than peak input/output difference. Output makeup no longer contaminates the meter.
- Detector tap storage is allocated in prepareToPlay(), never in the audio callback.
- Bypass crossfade scales reported compressor GR down to zero.
- Global gainReductionMeter now follows compressor detector.

Not yet tested: Windows VST3 compilation or host integration. Other effect GR telemetry still uses peak differences and is not detector-accurate.
