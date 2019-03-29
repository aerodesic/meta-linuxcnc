SUMMARY = "Add fb1 service"
MAINTAINER = "Gary Oliver <go@ao-cs.com>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac"

inherit systemd

S = "${WORKDIR}"

SRC_URI = " \
	file://hwclock-load.service \
	file://50-rtc-systemd.rules \
	file://COPYING \
"

do_install() {
    install -d ${D}${systemd_unitdir}/system/
    install -m 0644 ${WORKDIR}/hwclock-load.service ${D}${systemd_unitdir}/system/
    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/50-rtc-systemd.rules ${D}/${sysconfdir}/udev/rules.d
}

SYSTEMD_SERVICE_${PN} = "hwclock-load.service"

FILES_${PN} += "${systemd_unitdir}/system/* ${sysconfdir}/udev/rules.d/*"
