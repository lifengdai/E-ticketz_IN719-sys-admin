class bacula-file::config {
	if $hostname == 'mgmt' {
		file { "/etc/bacula/bacula-fd.conf":
			ensure =>present,
			source =>"puppet:///modules/bacula-file/mgmt-bacula-fd.conf",
			mode => 0444,
			owner => "bacula",
			group => "bacula",
			require => Class["bacula-file::install"],
			notify => Class["bacula-file::service"],
		}
	}
	elsif $hostname == 'app' {
		file { "/etc/bacula/bacula-fd.conf":
			ensure =>present,
			source =>"puppet:///modules/bacula-file/app-bacula-fd.conf",
			mode => 0444,
			owner => "bacula",
			group => "bacula",
			require => Class["bacula-file::install"],
			notify => Class["bacula-file::service"],
		}	
	}
	elsif $hostname == 'db' {
		file { "/etc/bacula/bacula-fd.conf":
			ensure =>present,
			source =>"puppet:///modules/bacula-file/db-bacula-fd.conf",
			mode => 0444,
			owner => "bacula",
			group => "bacula",
			require => Class["bacula-file::install"],
			notify => Class["bacula-file::service"],
		}	
	}
		elsif $hostname == 'storage' {
		file { "/etc/bacula/bacula-fd.conf":
			ensure =>present,
			source =>"puppet:///modules/bacula-file/storage-bacula-fd.conf",
			mode => 0444,
			owner => "bacula",
			group => "bacula",
			require => Class["bacula-file::install"],
			notify => Class["bacula-file::service"],
		}	
	}
	file {"/home/bacula":
			ensure => directory,
			owner => "bacula",
			group => "bacula",
			require => Class[bacula-file::install],
	}
	file {"/home/bacula/restores":
			ensure => directory,
			owner => "bacula",
			require => Class[bacula-file::install],
	}
}

