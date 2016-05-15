class nrpe_win{
	package { 'nsclient':
      		ensure          => installed,
      		source          => 'C:\NRPE\NSCP-0.4.2.114-x64.msi',
	  	install_options => [ { 'CONF_CAN_CHANGE' => 1, 'ALLOWED_HOSTS' => 'mgmt.micro-agnets.net', 'CONF_CHECKS' => 1, 'CONF_NRPE' => 1 } ],
    }
}