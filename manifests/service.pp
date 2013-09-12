# Installs Pow and the services
#
# Usage:
#
#     include pow::service
class pow::service {
  require pow

  exec { 'install pow firewall rules':
    user    => root,
    command => 'pow --install-system',
    require => Package['pow']
  }

  exec { 'install pow server':
    command => 'pow --install-local',
    require => Package['pow']
  }

  service { 'cx.pow.firewall':
    ensure  => running,
    require => [
      Exec['install pow firewall rules'],
      Exec['install pow server']
    ]
  }
}
