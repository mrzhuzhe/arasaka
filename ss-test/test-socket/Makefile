CFLAGS = 
LDFLAGS = 

sockets_test:
	$(CC) $(CFLAGS) -o outputs/server.o server.c utils.c $(LDFLAGS) 
	$(CC) $(CFLAGS) -o outputs/client.o client.c $(LDFLAGS)

.PHONY: test clean

test: sockets_test	

clean:
	rm -f *.o rm -f outputs/*.o