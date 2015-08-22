This is for booting an arm9 payload embedded in the built arm9bin. The arm11code is setup to jump to code initialized by the arm9 payload once signaled. This requires the "firm_builder" tool, since this is intended for use under a FIRM binary.

This must be built with the "ARM9PAYLOADPATH={path}" make param.

