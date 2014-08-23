# role_elasticsearch

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with role_elasticsearch](#setup)
    * [What role_elasticsearch affects](#what-role_elasticsearch-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with role_elasticsearch](#beginning-with-role_elasticsearch)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module to install elasticsearch.

## Module Description

This module will install elasticsearch with the kopf and kibana plugin. For the kibana plugin the url to the latest version is set. If you use the default version, the kibana webpage will display this warning 'Oops. Looks like you've upgraded from an old version'.

## Setup

### What role_elasticsearch affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements

elasticsearch/puppet-elasticsearch

### Beginning with role_elasticsearch

* elasticsearch: http://localhost:9200/_cluster/health?pretty=true
* kopf plugin: http://localhost:9200/_plugin/kopf
* kibana plugin: http://localhost:9200/_plugin/kibana

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
