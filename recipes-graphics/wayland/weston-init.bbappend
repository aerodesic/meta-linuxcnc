FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

RDEPENDS_${PN} += "bash"

SRC_URI += " \
	file://weston-wait-framebuffer \
	file://weston-wait-psplash \
	file://default.weston-systemd \
	file://default.weston \
	file://weston.ini \
"


do_install_append() {
	# Add function to wait for frame buffer to appear
	install -Dm755 ${WORKDIR}/weston-wait-framebuffer ${D}/${sbindir}/weston-wait-framebuffer
	install -Dm755 ${WORKDIR}/weston-wait-psplash     ${D}/${sbindir}/weston-wait-psplash

	# Add weston default config (launch on /dev/fb1)
	install -Dm 0755 ${WORKDIR}/default.weston ${D}${sysconfdir}/default/weston
	install -Dm 0755 ${WORKDIR}/default.weston-systemd ${D}${sysconfdir}/default/weston-systemd

	# Add weston.ini to etc
	install -Dm 0755 ${WORKDIR}/weston.ini ${D}${sysconfdir}
}

FILES_${PN} += "${sbindir}/* ${sysconfdir}/default"

