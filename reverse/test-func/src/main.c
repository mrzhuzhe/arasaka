#include <stdio.h>
#include <stdlib.h>

int fun1(){
    printf("Its hacked this is a unreachable function \n");
    return 0;
}

int main(){
    printf("123321 \n");
    fun1();
    return 0;
}