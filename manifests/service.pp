# Installs the Pow services
#
# Usage:
#
#     include pow::service
class pow::service {
  exec { 'install pow firewall rules':
    command => 'sudo pow --install-system',
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
