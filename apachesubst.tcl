#!/usr/bin/env tclsh
##
## apachesubst template engine
## - (C) 2013 - BeF <bef@pentaphase.de>
## - see https://github.com/bef/apachesubst
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.
##
package require fileutil

set disclaimer {## AUTO-GENERATED CONFIG FILE ##
## do not edit manually, but instead:
##   (1) edit *.tmpl
##   (2) call 'make'
##   done.
##
## OR edit manually anyway, but please
##   (1) remove the corresponding .tmpl
##   (2) remove this comment
##   done.
##
}
puts $disclaimer

proc substitute {args} {
	upvar 1 args template_args
	return [subst -nobackslashes -novariables {*}$args]
}
proc include {filename} {
	return [substitute [::fileutil::cat $filename]]
}
proc include_raw {filename} {
	return [::fileutil::cat $filename]
}
proc raw {data} {
	return $data
}

proc define_template {name data} {
	global templates
	set templates($name) $data
	return
}

proc use_template {template_name args} {
	global templates
	return [substitute $templates($template_name)]
}

proc value {varname {default_value {}}} {
	upvar 1 $varname var
	if {[info exists var]} {
		return $var
	}
	return $default_value
}

proc include_template_args {{num 0}} {
	upvar 1 template_args template_args
	return [substitute [lindex $template_args $num]]
}

puts -nonewline [substitute [read stdin]]


