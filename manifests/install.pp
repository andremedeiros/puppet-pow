# Installs Pow
#
# Usage:
#
#     include pow::install
class pow::install {
  package { 'pow':
    ensure   => $pow::version,
    provider => 'homebrew'
  }

  file { "/Users/${boxen::config::login}/.pow":
    ensure => directory
  }
}
