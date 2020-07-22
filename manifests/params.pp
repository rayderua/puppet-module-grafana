class grafana::params {

  $repo_location    = lookup('grafana::location', String, 'first', 'https://packages.grafana.com/oss/deb')
  $repo_release     = lookup('grafana::release', String, 'first', 'stable')
  $repo_repos       = lookup('grafana::repos', String, 'first', 'main')
  $repo_key_id      = lookup('grafana::key_id', String, 'first', '4E40DDF6D76E284A4A6780E48C8C34C524098CB6')
  $repo_key_src     = lookup('grafana::key_src', String, 'first', 'https://packages.grafana.com/gpg.key')

  $package_name     = lookup('grafana::package_name', String, 'first', 'grafana')
  $package_ensure   = lookup('grafana::package_ensure', String, 'first', 'installed')

  $service_name     = lookup('grafana::service_name', String, 'first', 'grafana-server')
  $service_ensure   = lookup('grafana::service_ensure', String, 'first', 'running')

  $env              = lookup('grafana::env', Hash, 'deep', {})
  $config           = lookup('grafana::config', Hash, 'deep', {})

}