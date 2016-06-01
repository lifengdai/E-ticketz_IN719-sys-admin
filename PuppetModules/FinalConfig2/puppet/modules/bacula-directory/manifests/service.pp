class bacula-directory::service {
	service {"bacula-director" :
	ensure => running,
	hasstatus => true,
	hasrestart => true,
	enable => true,
	require => Class["bacula-directory::config"],
	}
}
