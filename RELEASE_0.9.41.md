# ULT 0.9.41
- Palette OK uses its own ULT look and feel, Inter and current accent.
- Compressor transfer includes input drive, excludes output gain.
- Explicit editor teardown detaches toolbar listeners, controls and parameter attachments before destruction; latency timer skips inactive processor. Defensive changes only; crash root cause not established.
- No build/runtime validation performed.
