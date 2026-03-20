#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define BUFFER_CHUNK_SIZE 1024
#define BUFFER_FILE_SIZE 16384

int main() {
		char *keyword = "FILE_FLASH\n";
		char *filename = "/tmp/monitor";

		FILE *file = NULL;
		char buffer_file[BUFFER_FILE_SIZE] = {0};
		char buffer_chunk[BUFFER_CHUNK_SIZE] = {0};

		while(true) {
				fgets(buffer_chunk, BUFFER_CHUNK_SIZE, stdin);
		
				if (strcmp(buffer_chunk, keyword) != 0) {
						strcat(buffer_file, buffer_chunk);
						continue;
				}

				file = fopen(filename, "w");			
				fprintf(file, "%s", buffer_file);
				fclose(file);

				buffer_file[0] = '\0';
				buffer_chunk[0] = '\0';
		}

		return 0;
}

