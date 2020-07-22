class grafana::repo {

  include apt

  apt::source { 'grafana':
    location    => $grafana::repo_location,
    release     => $grafana::repo_release,
    repos       => $grafana::repo_repos,
    key         => {
      id  => $grafana::repo_key_id,
      src => $grafana::repo_key_src,
    }
  }

}