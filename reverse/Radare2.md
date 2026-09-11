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
```

## debug run 

1. Notice esil need seek first then excute but doo need run first then set break point address

```

doo
db 0x123123 # add a break point
dc # continue untile break point 

afvd # show variable
```