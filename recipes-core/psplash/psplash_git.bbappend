FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

inherit systemd

SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','psplash-linuxcnc.service','',d)}"

DEPENDS += "gdk-pixbuf-native"

PRINC = "9"

SRC_URI += " \
	file://psplash-colors.h \
	file://psplash-linuxcnc-img.png \
	file://psplash-linuxcnc.service \
"

# NB: this is only for the main logo image; if you add multiple images here,
#     poky will build multiple psplash packages with 'outsuffix' in name for
#     each of these ...

SPLASH_IMAGES = "file://psplash-linuxcnc-img.png;outsuffix=default"

# The core psplash recipe is only designed to deal with modifications to the
# 'logo' image; we need to change the bar image too, since we are changing
# colors
do_configure_append () {
	cd ${S}
	cp ../psplash-colors.h ./
	# strip the -img suffix from the bar png -- we could just store the
	# file under that suffix-less name, but that would make it confusing
	# for anyone updating the assets
	cp ../psplash-linuxcnc-img.png ./psplash-linuxcnc.png
	./make-image-header.sh ./psplash-linuxcnc.png BAR
}

do_install_append() {

	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
		install -d ${D}${systemd_unitdir}/system
		install -m 644 ${WORKDIR}/*.service ${D}/${systemd_unitdir}/system
	fi
}

FILES_${PN} += "/mnt/.psplash"

