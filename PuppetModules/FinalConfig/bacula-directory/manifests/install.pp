class bacula-directory::install {
        package { 'bacula-server' :
        ensure => present,  
}
	package { 'bacula-console' :
        ensure => present,
}
}

