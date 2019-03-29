SUMMARY = "A very basic Wayland image"
MAINTAINER = "Gary Oliver <go@ao-cs.com>"

IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"

IMAGE_INSTALL_append += "fb1"
IMAGE_INSTALL_append += "hwclock-load"
IMAGE_INSTALL_append += "systemd-network-enable"
IMAGE_INSTALL_append += "psplash"
IMAGE_INSTALL_append += "dtc"
IMAGE_INSTALL_append += "cups"
IMAGE_INSTALL_append += "cups-filters"
IMAGE_INSTALL_append += "poppler"
IMAGE_INSTALL_append += "ghostscript"
IMAGE_INSTALL_append += "e2fsprogs"
IMAGE_INSTALL_append += "e2fsprogs-resize2fs"
IMAGE_INSTALL_append += "hplip"
IMAGE_INSTALL_append += "systemupdater-systemd"

# IMAGE_INSTALL_append += "cups-doc"

# This generates a 'clash' with cups-filters while generating ipk version 
# IMAGE_INSTALL_append += "foomatic-filters"

# Core components - always needed; systemversion depends on other needs top-level pacakges
IMAGE_INSTALL_append += "systemversion"

LICENSE = "MIT"

UPDATE_MANAGEMENT_CACHE = "builder-package-cache"

inherit core-image distro_features_check update-management

REQUIRED_DISTRO_FEATURES = "wayland"

CORE_IMAGE_EXTRA_INSTALL = "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples sudo"
CORE_IMAGE_EXTRA_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"

