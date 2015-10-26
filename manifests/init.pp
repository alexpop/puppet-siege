# == Class: siege
#
# Defines the siege class and inherits params.pp
#

class siege (
  $url     = $siege::params::url,
  $content = $siege::params::content
) inherits siege::params {
  # TO-DO: use URI.parse or validate_re for URL validation
  validate_string($url)
}
