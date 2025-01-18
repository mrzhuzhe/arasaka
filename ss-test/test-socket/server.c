#include <stdio.h>
#include "utils.h"
#include <netinet/in.h>
#include <sys/socket.h>
#include <ctype.h>
#include <string.h>
#include <arpa/inet.h>

int main(int argc, char *argv[]){
    printf("test abc \n");
    test_fn();
    struct sockaddr_in svaddr, claddr;
    int sfd = 0, j;
    socklen_t len;
    char buf[100];
    char claddrStr[INET_ADDRSTRLEN];
    ssize_t numBytes;

    sfd = socket(AF_INET, SOCK_DGRAM, 0);
    svaddr.sin_family = AF_INET;
    svaddr.sin_addr.s_addr  = INADDR_ANY;
    svaddr.sin_port = htons(50001);
    
    //memset(&svaddr, 0 , sizeof(svaddr));

    if (bind(sfd, (struct sockaddr *)&svaddr, 0) ==-1 ) printf("sv bind fail\n");

    for (;;) {
        len = sizeof(struct sockaddr_in);
        numBytes = recvfrom(sfd, buf, 100, 0, (struct sockaddr *)&claddr, &len);
        if (numBytes) {
            printf("sv recvfrom fail\n");
        }
        if (inet_ntop(AF_INET, &claddr.sin_addr, claddrStr, INET_ADDRSTRLEN) == NULL){
            printf("Could not convert client address to string \n");
        } else {
            printf("Server received %ld bytes from %s %u \n", (long)numBytes, claddrStr, ntohs(claddr.sin_port));
        }

        for (j=0;j<numBytes;j++){
            buf[j] = toupper((unsigned char)buf[j]);
        }

        if (sendto(sfd, buf, numBytes, 0, (struct sockaddr *)&claddr, len) != numBytes) {
             printf("sv sendto fail\n");
        }
    }

    return 0;
}