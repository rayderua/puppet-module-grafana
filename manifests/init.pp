class grafana (
  # Setup repo (degfault: grafana repositoty)
  String $repo_location                                 = $grafana::params::repo_location,
  String $repo_release                                  = $grafana::params::repo_release,
  String $repo_repos                                    = $grafana::params::repo_repos,
  String $repo_key_id                                   = $grafana::params::repo_key_id,
  String $repo_key_src                                  = $grafana::params::repo_key_src,

  # package
  String $package_name                                  = $grafana::params::package_name,
  String $package_ensure                                = $grafana::params::package_ensure,

  # service
  String $service_name                                  = $grafana::params::service_name,
  Enum['stopped', 'running'] $service_ensure            = $grafana::params::service_ensure,
  Hash   $config                                        = $grafana::params::config,
  Hash   $env                                           = $grafana::params::env,

) inherits grafana::params {

  contain grafana::repo
  contain grafana::install
  contain grafana::config
  contain grafana::service

  Class["grafana::repo"]
  -> Class["grafana::install"]
  -> Class["grafana::config"]
  -> Class["grafana::service"]

}