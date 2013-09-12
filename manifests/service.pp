# Sets up the Pow services
#
# Usage:
#
#     include pow::service
class pow::service {
  $ensure = $pow::enable ? {true => running, default => stopped}

  exec { 'install pow firewall rules':
    user    => root,
    command => 'pow --install-system'
  }

  exec { 'install pow server':
    command => 'pow --install-local'
  }

  exec { 'export env':
    command => 'env > /tmp/puppet_boxen_env'
  }

  service { 'cx.pow.firewall':
    ensure  => $ensure,
    require => [
      Exec['install pow firewall rules'],
      Exec['install pow server']
    ]
  }
}
