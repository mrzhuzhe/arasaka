## install
```
./configure-plugins
./configure --prefix=$PWD/install --without-qjs 
make -j$(nproc)
make install
```


## cmdline
```
aa
pdd@main

e asm.bytes=false # dont show the byte

pdf@main~cmp


pdc@main # c like syntax


rax2 '(0x5a+0x1ec)*(0x5a+0x1ec)'
0x52b24


//  r2ghidra
e r2ghidra.casts = true // show explict type convert
pdg@main


//  print instruction
pi

```

## ESIL 

1. Notice esil need seek first then excute
2. ESIl can debug in a snippers code

``` 
aei # init VM
aeim # init memory
aeip # init IP
aer eax=0x41 # set eax=0x41
aer # show register status
V # visual mode
# p or P change visual mode
# s to step in S to step over

// show carry flag
dr cf 

```

## debug run 

1. Notice esil need seek first then excute but doo need run first then set break point address

```

doo
db 0x123123 # add a break point
dc # continue untile break point 

afvd # show variable

# show address dump
pxw @ rbp-0xc

# ERROR: type:int doesn't exist
tk type.int=int32_t

# show address variable
pxw @ 0x7fffe5938554

# find all symbol 

```

## radiff2 

```
# diff disamble
r2diff -D a.bak a
```

## seach and replace

```
# 90 is nop in intell 
wx 9090 @@/a ud2
wx 9090 @@/x 0f0b

# search and replace only in function
s sym.main
e search.from = `afi~offset[1]`
e search.to = `afbr`    // this is not always right due to obfs


```

## dissamble hex code 
```
rasm2 -a arm -b 32 -d 370301e32a1205e3d41546e3da2405e3cb2d45e3000060e23b190be3031e47e3f92504e36d2a46e3010080e00200a0e04d1800e3af1f4ae33b2a05e3e42047e3010080e1020080e1891b07e30e1045e3ed2307e3b72748e3010080e1020080e1c71f04e33f1d48e3112602e314264ce3900100e0900200e06d1d08e3b11540e3ef260be39f2946e3010080e1020080e12d1905e34f1a4fe3ce2008e3072940e3010000e0020000e0421405e30a154ae3bf2900e33f2a42e3010000e0020000e0c61909e3331343e3382c03e3c92f47e3000060e2bd1503e30b1c40e3bf2609e38a214ce3000060e2761007e36e1647e3582a06e35d2b4be3900100e0900200e0471602e3db1e43e30c2501e35a2249e3010020e0020020e09e1b03e38e1440e3ee2f04e3f4294de3000060e2aa1a0ae320184ee3822409e37c2048e3010080e1020080e10f1005e3f41149e3d92702e3d72747e3010080e00200a0e0c81904e30f1049e3ad2c04e3b22143e3010000e0020000e0bc1c08e3391546e3e62da0e3062040e3900100e0900200e0bf1805e3301145e3f32209e3392a43e3010020e0020020e0301002e38e1d49e3672806e3682240e3010000e0020000e0651c0ee3531649e39a2509e32a284ee3900100e0900200e0
```

```
# run 256k arm64 hex opcode
a=370301e33b100ae3de1243e3c72801e3a82c43e3000060e28b1a05e3df1043e3222c0fe3f4224ee3900100e0900200e03f1c08e3061e49e3152d04e3582b48e3900100e0900200e05f110fe30a1a45e383230ce3232543e3010080e1020080e1651a0ee3c11648e3eb2c09e3312247e3010080e00200a0e0281309e3921c4de3c22da0e3e72244e3010080e00200a0e0c01504e37d1445e3592607e39c2345e3010080e1020080e1ca1007e3c0164ee3a62c06e3372547e3010080e00200a0e00a1d05e3b91b4ce3192902e3f52542e3010000e0020000e0e31205e3ea1549e309280ce3362c4fe3900100e0900200e04f1a0de36a1642e3a5290de389204ce3010020e0020020e091180be3f11643e3952003e3542840e3010020e0020020e099100fe38a1f42e32c2605e39c2d45e3010080e00200a0e0201d01e3081a49e37c2305e33d2d43e3010080e1020080e1d4150ae3f3194fe3772c05e3902a40e3010020e0020020e0f51409e3291944e3642101e3802c46e3010080e00200a0e0d81400e32d174be36d2200e35c2442e3010080e1020080e19d1a0fe3f2114ce3822c08e3b22044e3010020e0020020e09d1705e39f1249e34d2700e32a2346e3000060e21e150fe3f7114de3262b0ce3c4264ce3010080e00200a0e0
r2 -a arm -b 32 -c "wx $a @ 0; aei; aeim; aec ; aer r0;" malloc://262144
# qc is exist
r2 -a arm -b 32 -qc "wx $a @ 0; aei; aeim; aec; aer r0;" malloc://262144

# test
r2 -a arm -b 32 -c "wx $a @ 0; aei; aeim;" malloc://262144
```