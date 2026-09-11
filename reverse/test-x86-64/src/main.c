#include <stdio.h>
#include <stdlib.h>

int unreachablefunction(){
    printf("Its hacked this is a unreachable function \n");
    return 0;
}

int main(){
    int a = 123;
    int b = 456;
    int c = 890;
    a += 111;
    b += 222;
    c += 333;
    printf("%d %d %d 123321 \n",a, b, c);
    return 0;
}

/*
set disassembly-flavor intel
b main
disas
x/1xb $rip
x/1xw $rip
disas unreachablefunction
set $rip = 0x0000555555555149
*/

//   Notice: this is only for x86 32