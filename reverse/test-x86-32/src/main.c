#include <stdio.h>
#include <stdlib.h>

int unreachablefunction(){
    printf("Its hacked this is a unreachable function \n");
    return 0;
}

int main(){
    printf("123321 \n");
    return 0;
}

/*
set disassembly-flavor intel
b main
disas
rip is eip in x64
x/1xb $eip
x/1xw $eip
disas unreachablefunction
set $eip = 0x0000555555555149
*/

//   Notice: this is only for x86 32