#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>

#define BUFFER_CHUNK_SIZE 1024
#define BUFFER_FILE_SIZE 16384

int main() {
		char *keyword = "FILE_FLASH\n";
		char *filename = "/tmp/monitor";

		char buffer_file[BUFFER_FILE_SIZE] = {0};
		char buffer_chunk[BUFFER_CHUNK_SIZE] = {0};

		FILE *file = NULL;
		file = fopen(filename, "w");

		while(true) {
				fgets(buffer_chunk, BUFFER_CHUNK_SIZE, stdin);

				if (strcmp(buffer_chunk, keyword) != 0) {
						strcat(buffer_file, buffer_chunk);
						continue;
				}

				ftruncate(fileno(file), 0);
				fprintf(file, "%s", buffer_file);
				fflush(file);
				rewind(file);

				buffer_file[0] = '\0';
				buffer_chunk[0] = '\0';
		}

		fclose(file);
		return 0;
}

