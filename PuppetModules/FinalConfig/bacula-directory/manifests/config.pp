class bacula-directory::config {
	file { "/etc/bacula/bacula-dir.conf":
		ensure =>present,
		source =>"puppet:///modules/bacula-directory/bacula-dir.conf",
		mode => 0444,
		owner => "bacula",
		group => "bacula",
		require => Class["bacula-directory::install"],
		notify => Class["bacula-directory::service"],
	
	}

	file { "/etc/bacula/bconsole.conf":
	ensure => present,
	source => "puppet:///modules/bacula-directory/bconsole.conf",
	mode => 0555,
	owner => "bacula",
	group => "bacula",		
	require => Class["bacula-directory::install"],
	notify => Class["bacula-directory::service"],

	}
}