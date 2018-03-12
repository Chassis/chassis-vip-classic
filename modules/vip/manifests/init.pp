# Automattic VIP Classic Beta extension for Chassis
class vip (
		$php = $::vip_config[php],
		$path  = '/vagrant/extensions/vip-classic',
) {

		file { "${$path}/local-config.php":
			content => template('vip/local-config.php.erb'),
			owner   => 'www-data',
			group   => 'www-data',
			mode    => '0644',
		}

		file { "${$path}/roles.php":
			content => template('vip/roles.php.erb'),
			owner   => 'www-data',
			group   => 'www-data',
			mode    => '0644',
		}

		file { "${$path}/vip-config.php":
			content => template('vip/vip-config.php.erb'),
			owner   => 'www-data',
			group   => 'www-data',
			mode    => '0644',
		}
}
