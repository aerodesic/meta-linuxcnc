FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

SRC_URI += " \
	file://0001-Add-FT8xx-drivers-to-FBTFT-suite.patch \
	file://0002-Added-overlay-for-ds3234-on-raspberrypi-spi0-1.patch \
	file://linuxcnc.cfg \
"


MACHINE_EXTRA_RDEPENDS += "kernel-module-fb_ft81x"

