# DEPENDS = "cups pkgconfig glib-2.0 glib-2.0-native dbus dbus-glib ghostscript libpng"
# DEPENDS_class-native = "glib-2.0-native dbus-native pkgconfig-native gettext-native libpng-native"

DEPENDS += "cups"
DEPENDS_class-native += " cups-native"

do_configure_prepend() {
    echo PKG_CONFIG ${PKG_CONFIG}
    echo PKG_CONFIG_PATH ${PKG_CONFIG_PATH}
    echo PKG_CONFIG_LIBDIR ${PKG_CONFIG_LIBDIR}
}

# inherit pkgconfig
