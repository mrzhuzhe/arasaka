# Bad case

adc set flag instead adcs

```
disassembly ['movw r0, #0x1337', 'movw r1, #0x5d91', 'movt r1, #0x353b', 'movw r2, #0x310d', 'movt r2, #0x6126', 'rsb r0, r0, #0', 'movw r1, #0xab22', 'movt r1, #0x58da', 'movw r2, #0x61a0', 'movt r2, #0x4464', 'rsb r0, r0, #0', 'movw r1, #0xfc65', 'movt r1, #0x7052', 'movw r2, #0x106a', 'movt r2, #0x317c', 'and r0, r0, r1', 'and r0, r0, r2', 'movw r1, #0xcfe3', 'movt r1, #0x3fa', 'movw r2, #0x7019', 'movt r2, #0xb2e0', 'and r0, r0, r1', 'and r0, r0, r2', 'movw r1, #0x7f96', 'movt r1, #0xf10a', 'movw r2, #0xf3b4', 'movt r2, #0x2be', 'orr r0, r0, r1', 'orr r0, r0, r2', 'movw r1, #0x29fb', 'movt r1, #0xe538', 'movw r2, #0x6722', 'movt r2, #0x9480', 'eor r0, r0, r1', 'eor r0, r0, r2', 'movw r1, #0xf816', 'movt r1, #0x3c98', 'movw r2, #0x2b9a', 'movt r2, #0xe90a', 'eor r0, r0, r1', 'eor r0, r0, r2', 'movw r1, #0x84bb', 'movt r1, #0xb6b3', 'movw r2, #0xfa8e', 'movt r2, #0x9e53', 'mul r0, r0, r1', 'mul r0, r0, r2', 'movw r1, #0x7cb0', 'movt r1, #0x35b7', 'movw r2, #0xe802', 'movt r2, #0x25d9', 'add r0, r0, r1', 'adc r0, r0, r2', 'movw r1, #0xc5e1', 'movt r1, #0x590f', 'movw r2, #0xf9d1', 'movt r2, #0x8b8', 'sub r0, r0, r1', 'sbc r0, r0, r2', 'movw r1, #0x1616', 'movt r1, #0xdcd9', 'movw r2, #0x882e', 'movt r2, #0xce62', 'sub r0, r0, r1', 'sbc r0, r0, r2', 'movw r1, #0x7a16', 'movt r1, #0xa884', 'movw r2, #0x9317', 'movt r2, #0x53d6', 'mul r0, r0, r1', 'mul r0, r0, r2', 'movw r1, #0x4ddf', 'movt r1, #0xad55', 'movw r2, #0x355f', 'movt r2, #0xf1d3', 'orr r0, r0, r1', 'orr r0, r0, r2', 'movw r1, #0x765d', 'movt r1, #0xe870', 'movw r2, #0x2070', 'movt r2, #0xbc38', 'sub r0, r0, r1', 'sbc r0, r0, r2', 'movw r1, #0x9c64', 'movt r1, #0xd944', 'movw r2, #0xfdee', 'movt r2, #0xe592', 'orr r0, r0, r1', 'orr r0, r0, r2', 'movw r1, #0x9d48', 'movt r1, #0x75eb', 'movw r2, #0x8427', 'movt r2, #0x9491', 'mul r0, r0, r1', 'mul r0, r0, r2', 'movw r1, #0xe90f', 'movt r1, #0x3adb', 'movw r2, #0xd067', 'movt r2, #0xe60d', 'and r0, r0, r1', 'and r0, r0, r2', 'movw r1, #0xeadc', 'movt r1, #0x7c35', 'movw r2, #0xf081', 'movt r2, #0xacfd', 'sub r0, r0, r1', 'sbc r0, r0, r2', 'movw r1, #0xcb25', 'movt r1, #0xb7ab', 'movw r2, #0x5f2', 'movt r2, #0x1a8e', 'sub r0, r0, r1', 'sbc r0, r0, r2', 'movw r1, #0x6ac', 'movt r1, #0x31a6', 'movw r2, #0x3896', 'movt r2, #0xdbbf', 'add r0, r0, r1', 'adc r0, r0, r2']

 370301e3911d05e33b1543e30d2103e3262146e3000060e2221b0ae3da1845e3a02106e3642444e3000060e2651c0fe3521047e36a2001e37c2143e3010000e0020000e0e31f0ce3fa1340e3192007e3e0224be3010000e0020000e0961f07e30a114fe3b4230fe3be2240e3010080e1020080e1fb1902e338154ee3222706e3802449e3010020e0020020e016180fe3981c43e39a2b02e30a294ee3010020e0020020e0bb1408e3b3164be38e2a0fe3532e49e3900100e0900200e0b01c07e3b71543e302280ee3d92542e3010080e00200a0e0e1150ce30f1945e3d1290fe3b82840e3010040e00200c0e0161601e3d91c4de32e2808e3622e4ce3010040e00200c0e0161a07e384184ae3172309e3d62345e3900100e0900200e0df1d04e3551d4ae35f2503e3d3214fe3010080e1020080e15d1607e370184ee3702002e3382c4be3010040e00200c0e0641c09e344194de3ee2d0fe392254ee3010080e1020080e1481d09e3eb1547e3272408e3912449e3900100e0900200e00f190ee3db1a43e367200de30d264ee3010000e0020000e0dc1a0ee3351c47e381200fe3fd2c4ae3010040e00200c0e0251b0ce3ab174be3f22500e38e2a41e3010040e00200c0e0ac1600e3a61143e3962803e3bf2b4de3010080e00200a0e0
476 0x1dc
0 b'0x11f952cd\n'
Register r0:0x11f952cc
```

```
# test
r2 -a arm -b 32 -c "wx $a @ 0; aei; aeim;" malloc://262144
```

```
rasm2 -a arm -b 32 -f outputs/b.txt -o outputs/out.bin
```