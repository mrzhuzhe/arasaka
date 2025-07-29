#include "stdio.h"

void inner(float* res, unsigned i, unsigned j, unsigned w){
    res[i*w+j] = (float)(i*w+j);
}

void loop(float* res, unsigned n, unsigned w){
    for(int i=0;i<n;i++){
        for(int j=0;j<w;j++){
            inner(res, i, j, w);
        }
    }
}

int main(){
    int n = 100;
    float res[n*n]{0};
    loop(res, n, n);
    printf("%f \n", res[3]);
    return 0;
}