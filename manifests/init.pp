# @summary Sets up the IUS yum repositories
#
# @example
#   include ius
#
# @param ius_enabled
#   Sets whether the ius repo is enabled by default
#
class ius (
  Enum['0','1'] $ius_enabled = '1',
) {
  $release = $facts['os']['release']['major']

  yumrepo {
    default:
      repo_gpgcheck => '0',
      gpgcheck      => '1',
      gpgkey        => "https://repo.ius.io/RPM-GPG-KEY-IUS-${release}",
    ;
    'ius':
      descr         => "IUS for Enterprise Linux ${release} - \$basearch",
      baseurl       => "https://repo.ius.io/${release}/\$basearch/",
      enabled       => $ius_enabled,
    ;
    'ius-debuginfo':
      descr         => "IUS for Enterprise Linux ${release} - \$basearch - Debug",
      baseurl       => "https://repo.ius.io/${release}/\$basearch/debug/",
      enabled       => '0',
    ;
    'ius-source':
      descr         => "IUS for Enterprise Linux ${release} - Source",
      baseurl       => "https://repo.ius.io/${release}/src/",
      enabled       => '0',
    ;
  }

  yumrepo {
    [
      'ius-archive',
      'ius-archive-debuginfo',
      'ius-archive-source',
      'ius-dev',
      'ius-dev-debuginfo',
      'ius-dev-source',
      'ius-testing',
      'ius-testing-debuginfo',
      'ius-testing-source',
    ]:
    ensure => 'absent',
  }
}
