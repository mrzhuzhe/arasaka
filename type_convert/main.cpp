#include <iostream>
#include "string.h"

#define  USER_CORRECT_PASSWD "oPhTUsrFjh1iKE"

int vuln(const char*buf, char len)
{
    printf("buf size %d\n", len);
    if (strncmp(USER_CORRECT_PASSWD, buf, len)==0) {
        printf("heck yeah you sucker\n");
    } else {
        printf("no today\n");
    }
}

int main(){
    char c = 127;
    printf("char %c %b \n", c, c);

    int n1 = 0;
    for (int i=0; i <31;i++){
        n1 += 1 << i;
    } // limit
    std::cout<< n1 << std::endl;
    printf("%u %32b \n", n1, n1);

    int n2 = n1 + 1; // overflow 
    std::cout<< n2 << std::endl;
    printf("%u %32b \n", n2, n2);

    char *case0 = "123";
    vuln(case0, strnlen(case0, 0x1000));
    printf("end %b %b %b %b \n", case0[0], case0[1], case0[2], case0[3]);

    // strnlen return is size_t will overflow in size_t to char convert
    // malloc vs array
    int len = (1<<1);
    char *case1 = (char*)malloc(len*sizeof(char));
    //memset(case1, '1', len);  // must set
    vuln(case1, strnlen(case1, 0x1000));
    
    memset(case1, '1', len);  // must set
    vuln(case1, strnlen(case1, 0x1000));
    
    len = (1<<7);
    memset(case1, '1', len);  // must set
    vuln(case1, strnlen(case1, 0x1000));

    len = (1<<8);
    memset(case1, '1', len);  // must set
    vuln(case1, strnlen(case1, 0x1000));


    return 0;
}