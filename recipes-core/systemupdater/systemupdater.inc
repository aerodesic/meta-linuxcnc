SUMMARY = "Updater for installed signed packages"
HOMEPAGE = "http://ao-cs.com"
MAINTAINER = "Gary Oliver <go@ao-cs.com>"
SECTION = "optional"
LICENSE = "GPLv2+"
PR = "r0"

DEPENDS = " \
"

RDEPENDS_${PN} = " \
	bash				\
	coreutils			\
	gnupg				\
	python3				\
"

S = "${WORKDIR}"

SRC_URI = " \
	file://${PN}			\
"

do_install() {
	install -m 0755 -d ${D}${sbindir}
	install -m 0755 ${PN} ${D}${sbindir}
}


FILES_${PN} += "${sbindir}"

