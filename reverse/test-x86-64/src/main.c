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
x/1xb $rip
x/1xw $rip
disas unreachablefunction
set $rip = 0x0000555555555149
*/

//   Notice: this is only for x86 32