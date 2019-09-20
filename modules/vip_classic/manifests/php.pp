# Automattic VIP Classic Beta extension for Chassis
# lint:ignore: no-names_containing_dash-check
class vip_classic::php (
  $php = $::config[php]
) {
		if ( ! empty( $::config[disabled_extensions] ) and 'chassis/vip-classic' in $::config[disabled_extensions] ) {
				$file = absent
		} else {
				$file = present
		}

	if versioncmp($php, '5.4') <= 0 {
		$php_package = 'php5'
		$php_dir = 'php5'
	}
	else {
		$php_package = $php
		$php_dir = "php/${php}"
	}

	# Bump max_input_vars to match WordPress.com
	file_line { 'max_input_vars = 6144':
		ensure  => $file,
		path    => "/etc/${$php_dir}/fpm/php.ini",
		line    => 'max_input_vars = 6144',
		match   => '^(; max_input_vars|max_input_vars)',
		notify  => Service["php${$php_package}-fpm"],
		require => Package["php${$php_package}-fpm"]
	}
}
