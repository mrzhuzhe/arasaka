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
    printf("%b \n", case0[3]);

    // strnlen return is size_t will overflow in size_t to char convert
    // malloc vs array
    int len = (1<<8);
    //  malloc does not have length like array
    char *case1 = (char*)malloc(len*sizeof(char));
    vuln(case1, strnlen(case1, 0x1000));

    case1[len-1] = '\0';
    std::cout << (char)case1[len-1] << std::endl;
    vuln(case1, strnlen(case1, 0x1000));
    

    return 0;
}