node default {
	#package { 'vim': ensure => present }
	#package { 'mc': ensure => present }
	include hosts_file
}

node 'db.micro-agents.net' {
	include mysql
	include nrpe
	include sudo
	include bacula-file
	include hosts_file
	package { 'ntp': ensure => present }
}
node 'app.micro-agents.net' {
	include nrpe
	include sudo
	include bacula-file
	include hosts_file
	package { 'ntp': ensure => present }
}
node 'storage.micro-agents.net' {
	include nrpe
	include sudo
	include bacula-storage
	include bacula-file
	include hosts_file
	package { 'ntp': ensure => present }
}

node 'mgmt.micro-agents.net' {
	include nagios3
	include sudo
	include bacula-directory
	include bacula-file
	include hosts_file
	package { 'ntp': ensure => present }
}

node 'ad.directory.micro-agents.net' {
	include nrpe_win
	include hosts_file
}
