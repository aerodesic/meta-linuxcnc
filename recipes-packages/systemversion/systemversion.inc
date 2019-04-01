SUMMARY = "Version identifier for system software."
HOMEPAGE = "http://www.ao_cs.com"
MAINTAINER = "Gary Oliver <go@ao-cs.com>"
SECTION = "optional"
LICENSE = "GPLv2"

do_install_append() {
	install -m 755 -d ${D}${sysconfdir}
	echo ${PV} > ${D}${sysconfdir}/${PN}
}

FILES_${PN} = "${sysconfdir}"

