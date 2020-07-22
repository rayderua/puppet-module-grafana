class grafana::defaults {

  $env = {
    'GRAFANA_USER'          => 'grafana',
    'GRAFANA_GROUP'         => 'grafana',
    'GRAFANA_HOME'          => '/usr/share/grafana',
    'LOG_DIR'               => '/var/log/grafana',
    'DATA_DIR'              => '/var/lib/grafana',
    'MAX_OPEN_FILES'        => 10000,
    'CONF_DIR'              => '/etc/grafana',
    'CONF_FILE'             => '/etc/grafana/grafana.ini',
    'RESTART_ON_UPGRADE'    => true,
    'PLUGINS_DIR'           => '/var/lib/grafana/plugins',
    'PROVISIONING_CFG_DIR'  => '/etc/grafana/provisioning',
    'PID_FILE_DIR'          => '/var/run/grafana',
  }

  $config = {
    'instance_name' => $::fqdn,
    'paths' => {
      'data'         => '/var/lib/grafana',
      'logs'         => '/var/log/grafana',
      'plugins'      => '/var/lib/grafana/plugins',
      'provisioning' => '/etc/grafana/conf/provisioning'
    },
    'server' => {
      'protocol'    => 'http',
      'http_addr'   => '127.0.0.1',
      'http_port'   => 3000,
      'domain'      => $::fqdn
    },
    'smtp' => {
      'enabled'       => true,
      'host'          => '127.0.0.1:25',
      'user'          => undef,
      'password'      => undef,
      'skif_verify'   => true,
      'from_address'  => "grafana@${::fqdn}",
      'from_name'     => 'Grafana',
    }
  }
}