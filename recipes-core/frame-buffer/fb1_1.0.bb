SUMMARY = "Add fb1 service"
MAINTAINER = "Gary Oliver <go@ao-cs.com>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac"

inherit systemd

S = "${WORKDIR}"

SRC_URI = " \
	file://fb1.service \
	file://COPYING \
"

do_install() {
    install -d ${D}${systemd_unitdir}/system/
    install -m 0644 ${WORKDIR}/fb1.service ${D}${systemd_unitdir}/system/
}

SYSTEMD_SERVICE_${PN} = "fb1.service"

FILES_${PN} += "${systemd_unitdir}/system/*"
