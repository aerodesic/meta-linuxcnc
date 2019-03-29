EXTRA_OECONF += "\
        --enable-network-build \
"

DEPENDS += " net-snmp"
RDEPENDS_${PN} += " net-snmp"
