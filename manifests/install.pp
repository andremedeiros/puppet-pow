# Installs Pow
#
# Usage:
#
#     include pow::install
class pow::install {
  package { 'pow':
    ensure   => 'latest',
    provider => 'homebrew'
  }

  file { "/Users/${boxen::config::login}/.pow":
    ensure => directory
  }
}
