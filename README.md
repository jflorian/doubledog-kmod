<!--
This file is part of the doubledog-kmod Puppet module.
Copyright 2017-2020 John Florian <jflorian@doubledog.org>
SPDX-License-Identifier: GPL-3.0-or-later
-->

# kmod

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with kmod](#setup)
    * [What kmod affects](#what-kmod-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with kmod](#beginning-with-kmod)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Classes](#classes)
    * [Defined types](#defined-types)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module lets you manage Linux kernel modules.

## Setup

## Usage

## Reference

**Classes:**

* [kmod](#kmod-class)

**Defined types:**

* [kmod::load](#kmodload-defined-type)


### Classes

#### kmod class

This class is the intended way to manage Linux kernel modules using this Puppet module.

##### `repos`
A hash whose keys are Puppet resource names and whose values are hashes comprising the same parameters you would otherwise pass to the [kmod::load](#kmodload-defined-type) defined type.  The default is none.


### Defined types

#### kmod::load defined type

This defined type manages the forced loading (and unloading) of kernel modules.  Typically, kernel modules are loaded on demand, but this type can be used for a more forceful, explicit approach.

##### `namevar`
An arbitrary identifier for the module-load instance unless the `module_name` parameter is not set in which case this must provide the value normally set with the `module_name` parameter.

##### `ensure`
Instance is to be `present` (default) or `absent`.  Alternatively, a Boolean value may also be used with `true` equivalent to `present` and `false` equivalent to `absent`.

##### `module_name`
The name of the kernel module to be loaded/unloaded.


## Limitations

Tested on modern Fedora and CentOS releases, but likely to work on any Red Hat variant.  Adaptations for other operating systems should be trivial as this module follows the data-in-module paradigm.  See `data/common.yaml` for the most likely obstructions.  If "one size can't fit all", the value should be moved from `data/common.yaml` to `data/os/%{facts.os.name}.yaml` instead.  See `hiera.yaml` for how this is handled.

This should be compatible with Puppet 3.x and is being used with Puppet 4.x as well.

## Development

Contributions are welcome via pull requests.  All code should generally be compliant with puppet-lint.
