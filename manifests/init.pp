#
# == Class: kmod
#
# Manages Linux kernel modules on a host.
#
# === Authors
#
#   John Florian <jflorian@doubledog.org>
#
# === Copyright
#
# This file is part of the doubledog-kmod Puppet module.
# Copyright 2020 John Florian
# SPDX-License-Identifier: GPL-3.0-or-later


class kmod (
        Hash[String[1], Hash]   $modules,
    ) {

    create_resources(kmod::load, $modules)

}
