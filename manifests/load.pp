#
# == Define: kmod::load
#
# Manage the loading of a kernel module.
#
# === Authors
#
#   John Florian <jflorian@doubledog.org>
#
# === Copyright
#
# This file is part of the doubledog-kmod Puppet module.
# Copyright 2017-2020 John Florian
# SPDX-License-Identifier: GPL-3.0-or-later


define kmod::load (
        Variant[Boolean, Enum['present', 'absent']] $ensure='present',
        String[1] $_name=$title,
    ) {

    case $ensure {

        'absent': {
            exec { "modprobe -r ${_name}":
                path   => '/bin:/sbin:/usr/bin:/usr/sbin',
                onlyif => "egrep -q '^${_name} ' /proc/modules",
            }
        }

        'present', default: {
            exec { "modprobe ${_name}":
                unless => "lsmod | grep -q '^${_name} '",
            }
        }

    }

    file { "/etc/modules-load.d/${_name}.conf":
        ensure  => $ensure,
        mode    => '0644',
        content => template('kmod/load.erb'),
    }

}
