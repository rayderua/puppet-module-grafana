class grafana::config inherits grafana::defaults {

  file {[
    '/etc/grafana',
    '/etc/grafana/provisioning',
    '/var/lib/grafana',
    '/var/lib/grafana/plugins',
    '/var/log/grafana',
  ]:
    ensure  => directory,
    owner   => 'grafana',
    mode    => '0755'
  }

  # defaults
  $env = deep_merge($grafana::defaults::env, $grafana::env)
  file {'/etc/default/grafana-server':
    ensure  => present,
    content => template("${module_name}/default.erb"),
    notify  => Service[$grafana::service_name],
    require => Package[$grafana::package_name],
  }

  # grafana.ini
  $config = deep_merge($grafana::defaults::config, $grafana::config)

  file {'/etc/grafana/grafana.ini':
    ensure  => present,
    content => template("${module_name}/grafana.ini.erb"),
    notify  => Service[$grafana::service_name],
    require => Package[$grafana::package_name],
  }

  file { '/etc/grafana/grafana.ini.default':
    ensure  => present,
    source  => "puppet:///modules/${module_name}/grafana.ini.default",
  }
}