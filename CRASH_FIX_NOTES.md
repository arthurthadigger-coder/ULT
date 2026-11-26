# v0.6.1 crash-fix notes

## Confirmed source defect

`EffectId` includes a reserved `Resonance` slot. The old `isEffectEnabled()` and `setEffectEnabled()` implementations indexed a nine-entry parameter-ID array using the ten-value enum. The final `Modulation` value therefore read past the end of the array. The same path was reached during state restore (the bypass-state loop visits every enum value) and when adding Modulation. The invalid pointer could be passed into string comparison and cause an access violation inside the plug-in module/runtime.

v0.6.1 replaces that lookup with `enabledParameterId()` using an explicit `switch`. `Resonance` maps to `nullptr` and is safely ignored; `Modulation` maps to `modOn`. This is consistent with both reported symptoms:
- Fruity Wrapper reports a crash while loading saved plug-in settings.
- Adding Modulation crashes FL Studio.

## Additional defensive changes

- Reject invalid, empty, oversized, or wrong-root state blobs before APVTS state replacement.
- Parse custom chain IDs strictly and filter the removed Resonance slot.
- Check third-party DSP handles before calling their processing functions.
- Include the MSVC `M_PI_2` definition in Density3 source.
- Include `createEditor()` in the complete source project, so the archive itself does not regress to the earlier unresolved-linker error.

## Remaining diagnostic

The source defect above is a concrete out-of-bounds bug and a strong match for the crash. If FL Studio still crashes with v0.6.1, collect its crash log from the FL Studio Support/Logs/Crash folder. The screenshot alone does not identify any additional native call-site beyond the module-level access violation.
