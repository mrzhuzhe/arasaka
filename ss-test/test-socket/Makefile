CFLAGS = 
LDFLAGS = 

sockets_test: sockets.c
	$(CC) $(CFLAGS) -o outputs/sockets.o sockets.c $(LDFLAGS)

.PHONY: test clean

test: sockets_test
	./outputs/sockets.o

clean:
	rm -f *.o