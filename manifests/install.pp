class grafana::install {

  package {"$grafana::package_name":
    ensure  => $grafana::package_ensure,
    require => [
      Apt::Source['grafana'],
      Exec['apt_update']
    ]
  }

}