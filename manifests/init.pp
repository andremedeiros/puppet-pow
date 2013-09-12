# Installs Pow using HomeBrew
#
# Usage:
#
#     include pow
class pow(
  $version = 'latest',
  $enable  = true
) {
  class{'pow::install': } ->
  class{'pow::service': } ->
  Class['pow']
}


