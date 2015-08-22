.arm

.global _start

_start:
ldr r0, =0x1ffffff8

waitarm11_init: @ Wait for the arm11 to init this mem.
ldm r0, {r1, r2}
orr r1, r1, r2
cmp r1, #0
bne waitarm11_init

bl payload

ldr r0, =0x1ffffff8
ldr r1, =0x54524241
str r1, [r0, #0] @ Tell the arm11 to exit the wait-loop, if that's still running.

waitarm11:
ldr r2, [r0, #0]
cmp r2, #2
bne waitarm11 @ Wait for the arm11 to exit the stub code.

b errorloop
.pool

errorloop:
b errorloop

payload:
.incbin ARM9PAYLOADPATH

