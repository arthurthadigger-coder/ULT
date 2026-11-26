# 0.9.42
- Disable JUCE Direct2D at build time (subject to JUCE checkout support), retain software peer selection and software icon copies, remove image-cache use for icons. Dismiss active menus before editor teardown. This is a targeted mitigation, not a confirmed crash fix.
- Shared popup painting: Inter, rounded dark panel, grey border, accent-tinted hover and selected row, accent selected text, scaled font. Explicit look-and-feel for preset and layout menus; combo boxes inherit it. Existing add-effect overlay retains its fixed-size card layout.
- Compressor display: unity below knee, knee = -18 dB minus input drive, ratio slope above knee, no output makeup. DSP unchanged.
- No Windows/JUCE build or runtime verification performed.
