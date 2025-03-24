#!/bin/bash -ex

# put stuff on the pi sd card.

pi_sd=/media/carl
pi_boot=${pi_sd}/bootfs
pi_root=${pi_sd}/rootfs

cat >>${pi_boot}/config.txt <<CT_EOF
dtoverlay=gpio-led,gpio=24,label=sshd
dtoverlay=i2c-gpio,i2c_gpio_sda=27,i2c_gpio_scl=17
CT_EOF

cp sshd_led.service ${pi_root}/etc/systemd/system
ln -sf /etc/systemd/system/system/sshd_led.service ${pi_root}/etc/systemd/system/multi-user.target.wants/sshd_led.service
