This is for booting an arm9 payload embedded in the built arm9bin. This is intended for running [bootldr9_rawdevice](https://github.com/yellows8/bootldr9_rawdevice), but other binaries could be used as well. The arm11code is setup to jump to code initialized by the arm9 payload once signaled. This requires the [ctr_firm_builder](https://github.com/derrekr/ctr_firm_builder) tool, since this is intended for use under a FIRM binary.

This must be built with the "ARM9PAYLOADPATH={path}" make param.

