
node default {
	package { 'vim': ensure => present }
	package { 'mc': ensure => present }
	include hosts_file
	include sudo
}

node 'db.micro-agents.net' {
	include mysql
}

node 'mgmt.micro-agents.net' {
	include nagios3
}
