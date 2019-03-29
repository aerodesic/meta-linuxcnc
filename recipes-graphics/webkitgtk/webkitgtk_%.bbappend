# Clashing include files
EXTRA_OECMAKE_append_raspberrypi3 = " -DUSE_GSTREAMER_GL=OFF "

# Make a standard webkitgtk.pc so others can find us
do_install_append() {
	install -d ${D}/${libdir}/pkgconfig
	# Wish I could use a symbol for the webkit2gtk-4.0.pc name
	install -m 0644 ${B}/Source/WebKit/webkit2gtk-4.0.pc ${D}/${libdir}/pkgconfig/webkit-1.0.pc
	install -m 0644 ${B}/Source/WebKit/webkit2gtk-4.0.pc ${D}/${libdir}/pkgconfig/webkit.pc
}
