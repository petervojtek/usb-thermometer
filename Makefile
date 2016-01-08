prefix ?= /usr/local
bindir ?= $(prefix)/bin
DESTDIR ?= /

all:	pcsensor

install: pcsensor
	test -d $(DESTDIR)$(bindir) || mkdir -p  $(DESTDIR)$(bindir)
	install -m 755 $^ $(DESTDIR)$(bindir)

CFLAGS = -O2 -Wall

pcsensor:	pcsensor.c
	${CC} -DUNIT_TEST -o $@ $^ -lusb

clean:		
	rm -f pcsensor *.o

rules-install:			# must be superuser to do this
	cp 99-tempsensor.rules /etc/udev/rules.d
