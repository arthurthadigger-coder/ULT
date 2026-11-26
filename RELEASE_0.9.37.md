# 0.9.37
- Gate and compressor history uses monotonic timestamps on a fixed 5000 ms axis, with gaps rather than invented samples during long UI stalls.
- Editor visibility controls atomic telemetry enablement; closed/hidden editors skip spectrum/pitch taps, meter scans and optional compressor/de-esser reduction measurements. Audio processing remains independent. Native occlusion not reported by the host is not detected.
- UI sampling remains nominally 60 Hz; missed samples are not reconstructed.
