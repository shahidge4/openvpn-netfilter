INSTALL	:= install
DESTDIR	:= /
PREFIX	:= /usr

all: 

install: plugin
	mkdir -p $(DESTDIR)$(PREFIX)/lib/openvpn/plugins
	mkdir -p $(DESTDIR)/etc/openvpn
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	$(INSTALL) -m755 netfilter_openvpn.py $(DESTDIR)$(PREFIX)/lib/openvpn/plugins
	$(INSTALL) -m600 netfilter_openvpn.conf.inc $(DESTDIR)/etc/netfilter_openvpn.conf
	$(INSTALL) -m755 scripts/vpn-fw-find-user.sh $(DESTDIR)$(PREFIX)/bin
	$(INSTALL) -m755 scripts/vpn-netfilter-cleanup-ip.sh $(DESTDIR)$(PREFIX)/bin

clean:
	rm -f *.o
	rm -f *.so
	rm -f *.pyc
	rm -rf __pycache__
