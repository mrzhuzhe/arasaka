#include <stdio.h>
#include <stdlib.h>
#include <ctime>
#include <cstdint>

// https://favas.blog/blogs/hackthebox/challenges/reversing/simple-encryptor/

int main(){   
    const char* target = "/mnt/src/sec/rev/a12c7354-6ee3-4584-912e-2f8b1c122ecf/rev_simpleencryptor/flag.enc";
    FILE *fptr;
    fptr = fopen(target, "r");
    printf("File opened successfully!\n");
    

    fseek (fptr, 0, 2);
    int fpos = ftell (fptr);
    fseek (fptr, 0, 0);
    printf("SEEK_CUR %d \n", SEEK_CUR);
    printf("SEEK_SET %d \n", SEEK_SET);
    printf("SEEK_END %d \n", SEEK_END);
    printf("fpos %d \n", fpos);
    srand(time(0));
    printf("rand %d \n", rand());
    printf("size of int %d \n", sizeof(int));
    const int len = 10;
    int buffer2[len];
    size_t elements_read = fread(buffer2, sizeof(int), len, fptr);
    printf("Successfully read %zud elements:\n", elements_read);
    for (size_t i = 0; i < elements_read; i++) {
        printf("%d ", buffer2[i]);
    }

    printf("\n");


    fseek (fptr, 0, 0);

    // Read seed value
    uint32_t seed;
    fread(&seed, sizeof(seed), 1, fptr);
    printf("seed: %d \n", seed);

    // Get file_size - seed value size (4 bytes) and allocate memory
    fseek(fptr, 0, SEEK_END);
    long file_size = ftell(fptr) - sizeof(seed);
    uint8_t *buffer = (uint8_t*)malloc(file_size);

    // Read encrypted file content to buffer
    fseek(fptr, sizeof(seed), SEEK_SET);
    fread(buffer, 1, file_size, fptr);
    //fclose(fptr);

    // Set seed value for rand()
    srand(seed);
    for (int i = 0; i < file_size; i++) {
        // generate random numbers like encrypt binary
        int rand_num_xor = rand();
        int rand_num_bitshift = rand();
        int shift_num = rand_num_bitshift & 7;

        // Reverse bit shifting and xor
        buffer[i] = (buffer[i] >> shift_num) | (buffer[i] << (8 - shift_num));
        buffer[i] = buffer[i] ^ rand_num_xor;
    }

    // Print result
    printf("%s\n", buffer);
    free(buffer);

    fclose(fptr);

    return 0;
}