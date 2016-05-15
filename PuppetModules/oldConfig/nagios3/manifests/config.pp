class nagios3::config {
        file { "/etc/nagios3/cgi.cfg":
                ensure => present,
                source => "puppet:///modules/nagios3/cgi.cfg",
                mode => 0444,
                owner => "nagios",
                group => "nagios",
                require => Class["nagios3::install"],
                notify => Class["nagios3::service"],
        }
	file { "/etc/nagios3/commands.cfg":
        	ensure => present,
	        source => "puppet:///modules/nagios3/commands.cfg",
		mode => 0555,
		owner => "nagios",
		group => "nagios",
		require => Class["nagios3::install"],
		notify => Class["nagios3::service"],
        }

	file { "/etc/nagios3/nagios.cfg":
		ensure => present,
		source => "puppet:///modules/nagios3/nagios.cfg",
		mode => 0555,
		owner => "nagios",
		group => "nagios",
		require => Class["nagios3::install"],
		notify => Class["nagios3::service"],
	}

	file { "/etc/nagios3/resource.cfg":
		ensure => present,
		source => "puppet:///modules/nagios3/resource.cfg",
		mode => 0555,
		owner => "nagios",
		group => "nagios",
		require => Class["nagios3::install"],
		notify => Class["nagios3::service"],
	}
	nagios_contact { 'laxmmr1':
		target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
		alias => 'Madhvi Laxman',
		service_notification_period => '24x7',
		host_notification_period => '24x7',
		service_notification_options => 'w,u,c,r',
		host_notification_options => 'd,r',
		service_notification_commands => 'notify-service-by-email',
		host_notification_commands => 'notify-host-by-email',
		email => 'root@localhost',
	}
	nagios_contactgroup { 'sysadmins':
		target => '/etc/nagios3/conf.d/ppt_cotactgroups.cfg',
		alias => 'Systems Administrators',
		members => 'laxmmr1',
	}
	nagios_host { 'db.micro-agents.net':
		target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
		alias => 'db',
		address => '10.25.1.62',
                check_period => '24x7',
                max_check_attempts => 3,
                check_command => 'check-host-alive',
                notification_interval => 30,
                notification_period => '24x7',
                notification_options => 'd,u,r',
                contact_groups => 'sysadmins',
	}
	nagios_service {'MySQL':
              service_description => 'MySQL DB',
              hostgroup_name => 'db-servers',
              target => '/etc/nagios3/conf.d/ppt_mysql_service.cfg',
              check_command => 'check_mysql',
              max_check_attempts => 3,
              retry_check_interval => 1,
              normal_check_interval => 5,
              check_period => '24x7',
              notification_interval => 30,
              notification_period => '24x7',
              notification_options => 'w,u,c',
              contact_groups => 'sysadmins',
  }
	nagios_hostgroup{'db-servers':
              target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
              alias => 'Database Servers',
              members => 'db.micro-agents.net',
  }

}
