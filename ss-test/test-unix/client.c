#include <stdio.h>
#include <sys/un.h>
#include <sys/socket.h>
#include <string.h>
#include <unistd.h>

#define SV_SOCK_PATH "./outputs/us_xfr"

int main(int argc, char *argv[]){
    
    struct sockaddr_un addr;
    int sfd = 0;
    ssize_t numRead;
    char buf[100];

    //memset(&addr, 0 , sizeof(addr));
    // AF_UNIX is on same host 
    sfd = socket(AF_UNIX, SOCK_STREAM, 0);
    addr.sun_family = AF_UNIX;
    strncpy(addr.sun_path, SV_SOCK_PATH, sizeof(addr.sun_path)-1);

    if (connect(sfd, (struct sockaddr *)&addr, sizeof(addr)) == -1){
        printf("connect fail \n");
    }

    while ((numRead = read(STDIN_FILENO, buf, 100))>0){
        if (write(sfd, buf, numRead) != numRead) {
            printf("write fail \n");
        }
    }

    return 0;
}