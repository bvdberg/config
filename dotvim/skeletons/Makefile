CFLAGS=-Wall -Wextra -Wno-unused -Wno-unused-parameter -Wshadow -std=c99 -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS

SOURCES=main.c
#HEADERS=

test: $(SOURCES)
	gcc $(CFLAGS) $(SOURCES) -o test

clean:
	rm -f *.o test

