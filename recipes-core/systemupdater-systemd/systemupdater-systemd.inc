SUMMARY = "Updater for installed signed packages"
HOMEPAGE = "http://www.cpac.com"
MAINTAINER = "Gary Oliver <go@ao-cs.com>"
SECTION = "cpac"
LICENSE = "CLOSED"
PR = "r0"

inherit systemd

DEPENDS = " \
"

RDEPENDS_${PN} = " \
	bash				\
	coreutils			\
	systemupdater			\
"

S = "${WORKDIR}"

SRC_URI = " \
	file://systemupdater.service		\
"

do_install() {
	install -d ${D}${systemd_unitdir}/system/
	install -m 0644 ${WORKDIR}/systemupdater.service ${D}${systemd_unitdir}/system/
}

SYSTEMD_SERVICE_${PN} = "systemupdater.service"

FILES_${PN} += "${systemd_unitdir}/system/*"

