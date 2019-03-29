
do_deploy_append() {
	# Enable SPI1
	echo "dtoverlay=spi1-3cs" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

	# Disable serial
	echo "dtparam=uart0=off" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "enable_uart=0" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

	# Enable RTC DS3234 overlay
	echo "dtoverlay=spi-rtc-ds3234" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

	# Enable power off and shutdown control
        # Pin to pull power
	# echo dtoverlay=gpio-poweroff,gpio_pin=1,active_low="y" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

        # Pin to start shutdown
	# echo dtoverlay=gpio-shutdown,gpio_pin=0,active_low="y" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}
