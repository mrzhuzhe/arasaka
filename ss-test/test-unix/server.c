#include <stdio.h>
#include "utils.h"
#include <sys/un.h>
#include <sys/socket.h>
#include <ctype.h>
#include <string.h>
#include <unistd.h> // what is this

#define SV_SOCK_PATH "./outputs/us_xfr"

int main(int argc, char *argv[]){
    printf("test abc \n");
    test_fn();
    struct sockaddr_un addr;
    int sfd = 0, cfd;
    char buf[100];
    ssize_t numBytes;

    sfd = socket(AF_UNIX, SOCK_STREAM, 0);
    if (sfd == -1) printf("sv socket fail\n"); 

    if (remove(SV_SOCK_PATH)==-1) printf("remove fail\n");

    //memset(&svaddr, 0 , sizeof(svaddr));
    addr.sun_family = AF_UNIX;
    strncpy(addr.sun_path, SV_SOCK_PATH, sizeof(addr.sun_path)-1);

    if (bind(sfd, (struct sockaddr *)&addr, sizeof(addr)) ==-1 ) printf("sv bind fail\n");

    if(listen(sfd, 5) == -1) printf("listen fial \n");

    for (;;) {
        cfd = accept(sfd, NULL, NULL);
        if (cfd == -1) {
            printf("accept fail \n");
        }

        while ((numBytes = read(cfd, buf, 100))>0)
        {
            if (write(STDOUT_FILENO, buf, numBytes) != numBytes){
                printf("write fail \n");
            }
        }
        
        close(cfd);
    }

    return 0;
}