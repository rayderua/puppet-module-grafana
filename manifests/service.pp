class grafana::service {

  service{ $grafana::service_name:
    ensure => $grafana::service_ensure
  }

}