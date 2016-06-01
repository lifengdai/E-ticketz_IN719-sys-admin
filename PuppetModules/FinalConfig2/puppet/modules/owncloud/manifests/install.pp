class owncloud::install {
	package { "owncloud" :
		ensure => present,
	}

	file { "/etc/apt/sources.list.d/owncloud.list":
      		ensure => present,
      		source => "puppet:///modules/owncloud/owncloud.list",
       		mode  => 0644,
	      	owner  => "root",
	      	group  => "root",
	      	before  => package["owncloud"],
   	}

	exec {"Release.key":
		cwd => '/root',
		creates => '/root/Release.key',
		command => '/usr/bin/wget http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.04/Release.key',
		user => 'root',
		notify => Exec['apt-get Release.key'],
	}
	
	exec {"apt-get Release.key":
		cwd => '/root',
		user =>  'root',
		command => '/usr/bin/apt-key add Release.key',
		refreshonly => true, 
	}
}