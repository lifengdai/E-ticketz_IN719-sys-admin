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
		email => 'laxmmr1@student.op.ac.nz',
	}
	nagios_contact { 'dail3':
		target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
		alias => 'Derek',
		service_notification_period => '24x7',
		host_notification_period => '24x7',
		service_notification_options => 'w,u,c,r',
		host_notification_options => 'd,r',
		service_notification_commands => 'notify-service-by-email',
		host_notification_commands => 'notify-host-by-email',
		email => 'dail3@student.op.ac.nz',
	}
	nagios_contact { 'slack':
		target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
		alias => 'slack',
		service_notification_period => '24x7',
		host_notification_period => '24x7',
		service_notification_options => 'w,u,c,r',
		host_notification_options => 'd,r',
		service_notification_commands => 'notify-service-by-slack',
		host_notification_commands => 'notify-host-by-slack',
	}
	nagios_contactgroup { 'sysadmins':
		target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
		alias => 'Systems Administrators',
		members => 'laxmmr1, dail3, slack',
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

	nagios_host { 'storage.micro-agents.net':
		target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
		alias => 'storage',
		address => '10.25.1.63',
                check_period => '24x7',
                max_check_attempts => 3,
                check_command => 'check-host-alive',
                notification_interval => 30,
                notification_period => '24x7',
                notification_options => 'd,u,r',
                contact_groups => 'sysadmins',
	}
	nagios_host { 'app.micro-agents.net':
		target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
		alias => 'app',
		address => '10.25.1.66',
                check_period => '24x7',
                max_check_attempts => 3,
                check_command => 'check-host-alive',
                notification_interval => 30,
                notification_period => '24x7',
                notification_options => 'd,u,r',
                contact_groups => 'sysadmins',
	}

	nagios_host { 'ad.micro-agents.net':
		target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
		alias => 'ad',
		address => '10.25.1.65',
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
              check_command => 'check_mysql_cmdlinecred!$USER3$!$USER4$',
              max_check_attempts => 3,
              retry_check_interval => 1,
              normal_check_interval => 5,
              check_period => '24x7',
              notification_interval => 30,
              notification_period => '24x7',
              notification_options => 'w,u,c',
              contact_groups => 'sysadmins',
  }
	nagios_service {'remote-disk':
              service_description => 'Remote Disk Service',
              hostgroup_name => 'remote-disks',
              target => '/etc/nagios3/conf.d/ppt_rd_service.cfg',
              check_command => 'check_nrpe_1arg!check_hd',
              max_check_attempts => 3,
              retry_check_interval => 1,
              normal_check_interval => 5,
              check_period => '24x7',
              notification_interval => 30,
              notification_period => '24x7',
              notification_options => 'w,u,c',
              contact_groups => 'sysadmins',
  }
#	nagios_service {'remote-load':
 #             service_description => 'Remote Load Service',
  #            hostgroup_name => 'remote-load',
   #           target => '/etc/nagios3/conf.d/ppt_remote_load_service.cfg',
    #          check_command => 'check_nrpe_1arg!check_uptime',
     #         max_check_attempts => 3,
      #        retry_check_interval => 1,
       #       normal_check_interval => 5,
        #      check_period => '24x7',
         #     notification_interval => 30,
          #    notification_period => '24x7',
           #   notification_options => 'w,u,c',
            #  contact_groups => 'sysadmins',
 # }

	nagios_service {'remote-memory':
              service_description => 'Remote Memory Service',
              hostgroup_name => 'remote-memory',
              target => '/etc/nagios3/conf.d/ppt_remote_memory_service.cfg',
              check_command => 'check_nrpe_1arg!check_memory',
              max_check_attempts => 3,
              retry_check_interval => 1,
              normal_check_interval => 5,
              check_period => '24x7',
              notification_interval => 30,
              notification_period => '24x7',
              notification_options => 'w,u,c',
              contact_groups => 'sysadmins',
  }
#	nagios_service {'remote-service':
#              service_description => 'Remote Check Service',
#              hostgroup_name => 'remote-service',
#              target => '/etc/nagios3/conf.d/ppt_remote_memory_service.cfg',
#              check_command => 'check_nrpe_1arg!check_remoteservice',
#              max_check_attempts => 3,
#              retry_check_interval => 1,
#              normal_check_interval => 5,
#              check_period => '24x7',
#              notification_interval => 30,
#              notification_period => '24x7',
#              notification_options => 'w,u,c',
#              contact_groups => 'sysadmins',
#  }

	nagios_hostgroup{'db-servers':
              target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
              alias => 'Database Servers',
              members => 'db.micro-agents.net',
  }
	nagios_hostgroup{'remote-disks':
              target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
              alias => 'remote-disks',
              members => 'db.micro-agents.net, storage.micro-agents.net, app.micro-agents.net, ad.micro-agents.net',
  }

	nagios_hostgroup{'remote-load':
              target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
              alias => 'remote-uptime',
              members => 'db.micro-agents.net, storage.micro-agents.net, app.micro-agents.net, ad.micro-agents.net',
  }
	nagios_hostgroup{'remote-memory':
              target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
              alias => 'remote-memory',
              members => 'db.micro-agents.net, storage.micro-agents.net, app.micro-agents.net, ad.micro-agents.net',
  }
	nagios_hostgroup{'remote-service':
              target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
              alias => 'remote-service',
              members => 'db.micro-agents.net, storage.micro-agents.net, app.micro-agents.net, ad.micro-agents.net',
  }


}
