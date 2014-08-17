apachesubst - Template engine for Apache HTTPD configuration files
====================================================================

About
-----
apachesubst provides a trivial way to generate configuration files from templates.

Features:

* Easy to learn: Simple syntax (Tcl syntax)
* Easy to use: Generate site configurations from templates in seconds
* Powerful: Change all generated config files by changing its template
* Flexible: Can be used to generate arbitrary configuration files. (not limited to apache)
* Unobtrusive: Can be used with manually managed configuration files.
* Slim: Less than 100 Lines-of-Code. Check it out yourself.

Installation
------------
Required packages:

* Tcl 8.5 or later
* fileutil (usually installed with tcllib)

Installation:

Just copy `templates`, `Makefile` and `apachesubst.tcl` to your apache `sites-available` directory, e.g. `/etc/apache2/sites-available`.

Quick Introduction
------------------

* Take a look at the examples: `sample*.tmpl`
* Type `make`
* Done.

Syntax
------
A template file consists of text and Tcl commands. Tcl commands are enclosed in square brackets `[]`. Example:

	This is a [return "test"].

This alone would be a sufficient template engine by itself. In order to make repetitive tasks even more convenient, a few commands have been defined (see 'Extra Commands' below).

Extra Commands
--------------

* `substitute ...`: apply arguments to templating/substitution process
* `include <filename>`: include template file. usually used to include templates
* `include_raw <filename>`: include file as is
* `raw <data>`: use <data> as is
* `define_template <name> <data>`: define template
* `use_template <name> ...`: use template with arguments as defined
* `value <varname> <default>`: use variable if available, or otherwise default value
* `include_template_args [<num=0>]`: use inside `define_template` definition: insert argument <num>
