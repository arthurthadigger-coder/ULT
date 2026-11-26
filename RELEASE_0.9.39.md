# ULT 0.9.39
- Chain plus buttons shifted +4 logical pixels; send toggles and analyzer backgrounds use selected accent.
- HSV picker uses explicit software image storage and opaque drawing colour.
- EQ/De-Esser FFT increased to 8192, fractional-bin interpolation and pixel sampling; neutral EQ grid.
- Compressor transfer curve overlaid on IN/OUT history, meters retained.
- Autotune default controls on right; output pitch estimator uses fractional lag and reference tuning. Existing saved custom layouts remain authoritative.
- DeBess sensitivity increased and internal maximum ratio mapped to 48 dB; actual attenuation depends on signal and filter. GR scale extended.
- Saturator Drive range 48 dB; additional wet-path gain above 24 dB. Normalized host automation mapping changes with expanded range.
- Source inspection only; JUCE unavailable in build environment.
