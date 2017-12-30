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
# Copyright 2017 John Florian


define kmod::load (
        Variant[Boolean, Enum['present', 'absent']] $ensure='present',
        String[1] $_name=$title,
    ) {

    case $ensure {

        'present': {
            exec { "modprobe ${_name}":
                unless => "lsmod | grep -q '^${_name} '",
            }
        }

        'absent': {
            exec { "modprobe -r ${_name}":
                path   => '/bin:/sbin:/usr/bin:/usr/sbin',
                onlyif => "egrep -q '^${_name} ' /proc/modules",
            }
        }

    }

    file { "/etc/modules-load.d/${_name}.conf":
        ensure  => $ensure,
        mode    => '0644',
        content => template('kmod/load.erb'),
    }

}
