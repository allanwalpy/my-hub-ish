#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_CHUNK_SIZE 1024
#define BUFFER_FILE_SIZE 8192

int main() {
		char *keyword = "FILE_FLASH\n";
		char *filename = "/tmp/monitor";

		FILE *file = NULL;
		file = fopen(filename, "w");
		if (!file) {
				return 1;
		}

		char buffer_file[BUFFER_FILE_SIZE] = {0};
		char buffer_chunk[BUFFER_CHUNK_SIZE] = {0};
		char temp[BUFFER_CHUNK_SIZE] = {0};

		while(fgets(buffer_chunk, BUFFER_CHUNK_SIZE, stdin)) {
				char *match = strstr(buffer_chunk, keyword);
				
				if (match != NULL)
				{
						strncpy(temp, buffer_chunk, match - buffer_chunk - strlen(keyword) + 1);
						strcat(buffer_file, temp);
						
										fprintf(stderr, "a");
				fprintf(stderr, match);
				fprintf(stderr, "b");
						
						// fwrite(buffer_file, 1, strlen(buffer_file), file);
						fprintf(file, buffer_file);
						
						if (fflush(file) != 0) {
							return 2;
						}
						
						rewind(file);
						
						buffer_file[0] = '\0';
						/*strncpy(
							buffer_file,
							match + strlen(keyword),
							BUFFER_CHUNK_SIZE - (match - buffer_chunk + strlen(keyword))
						);*/
						
				}
				
				strcat(buffer_file, buffer_chunk);
		}

		return 0;
}

