#include "stdio.h"


// Note:
// We need 'no_instrument_function' attribute on __cyg_profile_fun_*
extern "C" {
    void __inst_profile()
    {
        printf("Do something here!\n");
    }

    // called every time a function get called
    __attribute__ ((no_instrument_function)) void __cyg_profile_func_enter (void *this_fn, void *call_site)
    {
        printf("Entering in 0x%lx from 0x%lx...\n", (unsigned long)this_fn, (unsigned long)call_site);
    }

    // called every time a function returns
    __attribute__ ((no_instrument_function)) void __cyg_profile_func_exit  (void *this_fn, void *call_site)
    {
        printf("Exiting from 0x%lx to 0x%lx...\n", (unsigned long)this_fn, (unsigned long)call_site);
    }
}

void inner(float* res, unsigned i, unsigned j, unsigned w){
    res[i*w+j] = (float)(i*w+j) * (float)(i*w+j);
}

__attribute((profiled))  void loop(float* res, unsigned n, unsigned w){
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