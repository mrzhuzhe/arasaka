#include <stdio.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>

int main(int argc, char *argv[]){
    
    struct sockaddr_in svaddr;
    int sfd = 0, j;
    ssize_t numBytes;
    char buf[100];

    //memset(&svaddr, 0 , sizeof(svaddr));
    // AF_UNIX is on same host 
    sfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sfd == -1) {
        printf("socket fail \n");
    }
    svaddr.sin_family = AF_INET;
    char * localhost = "127.0.0.1";
    svaddr.sin_port = htons(50001);

    if(inet_pton(AF_INET, localhost, &svaddr.sin_addr) <= 0){
        printf("inet_pton fail \n");
    }
    
    if (connect(sfd, (struct sockaddr *)&svaddr, sizeof(svaddr)) == -1){
        printf("connect fail \n");
    }

    char *msg = "test send \n";
    if ((numBytes = write(sfd, msg, strlen(msg))) == -1 ){
        printf("send fail");
    }

    if ((numBytes = read(sfd, buf, 100))>0){
        //buf[numBytes] = 0;
        //fputs(buf, stdout);
        printf("%s \n", buf);
    }

    close(sfd);
    return 0;
}