prefix ?= /usr/local
bindir ?= $(prefix)/bin
confdir ?= /etc/collectd/collectd.conf.d
DESTDIR ?= /

all:	pcsensor

install: pcsensor
	test -d $(DESTDIR)$(bindir) || mkdir -p  $(DESTDIR)$(bindir)
	install -m 755 $^ $(DESTDIR)$(bindir)

CFLAGS = -O2 -Wall

pcsensor:	pcsensor.c
	${CC} -DUNIT_TEST -o $@ $^ -lusb

clean:		
	rm -f pcsensor *.o collectd_pcsensor_temper.sh collectd_pcsensor_temper.conf

rules-install:			# must be superuser to do this
	cp 99-tempsensor.rules /etc/udev/rules.d

collectd_pcsensor_temper.sh: collectd_pcsensor_temper.sh.in
	sed -e "s|@@BIN_DIR@@|$(bindir)|" collectd_pcsensor_temper.sh.in > collectd_pcsensor_temper.sh

collectd_pcsensor_temper.conf: collectd_pcsensor_temper.conf.in
	sed -e "s|@@BIN_DIR@@|$(bindir)|" collectd_pcsensor_temper.conf.in > collectd_pcsensor_temper.conf

collectd-install: collectd_pcsensor_temper.sh collectd_pcsensor_temper.conf
	install -m 755 collectd_pcsensor_temper.sh $(DESTDIR)$(bindir)
	install -m 644 collectd_pcsensor_temper.conf $(DESTDIR)$(confdir)
