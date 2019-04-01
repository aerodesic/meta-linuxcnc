SUMMARY = "Updater for installed signed packages"
HOMEPAGE = "http://ao-cs.com"
MAINTAINER = "Gary Oliver <go@ao-cs.com>"
SECTION = "optional"
LICENSE = "GPLv2"

LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac"

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
	file://COPYING 			\
"

do_install() {
	install -m 0755 -d ${D}${sbindir}
	install -m 0755 ${PN} ${D}${sbindir}
}


FILES_${PN} += "${sbindir}"

