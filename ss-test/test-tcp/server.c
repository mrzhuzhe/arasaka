#include <stdio.h>
#include "utils.h"
#include <netinet/in.h>
#include <sys/socket.h>
#include <ctype.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>

int main(int argc, char *argv[]){
    printf("test abc \n");
    test_fn();
    struct sockaddr_in svaddr;
    int sfd = 0, cfd = 0;
    socklen_t len;
    char buf[100];
    ssize_t numBytes;

    sfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sfd == -1) printf("sv socket fail\n"); 

    memset(&svaddr, 0 , sizeof(svaddr));
    svaddr.sin_family = AF_INET;
    char * localhost = "127.0.0.1";
    if(inet_pton(AF_INET, localhost, &svaddr.sin_addr) <= 0){
        printf("inet_pton fail \n");
    }
    svaddr.sin_port = htons(50001);    

    if (bind(sfd, (struct sockaddr *)&svaddr, sizeof(svaddr)) ==-1 ) printf("sv bind fail\n");
    
    if(listen(sfd, 5) == -1) printf("listen fial \n");
    char *msg = "test back \n";
    for (;;) {
        cfd = accept(sfd, NULL, NULL);
        if (cfd == -1) {
            printf("accept fail \n");
        }

        if ((numBytes = read(cfd, buf, 100))>0)
        {
            // fputs(buf, stdout);
            printf("%s \n", buf);            
        }
        if (write(cfd, msg, strlen(msg)) == -1){
            printf("write fail \n");
        }

        close(cfd);
    }


    return 0;
}