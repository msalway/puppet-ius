# @summary Sets up the IUS yum repositories
#
# @example
#   include ius
#
# @param ius_enabled
#   Sets whether the ius repo is enabled by default
#
class ius (
  Integer[0,1] $ius_enabled = 1,
) {
  yumrepo { 'ius':
    descr         => 'IUS for Enterprise Linux 7 - $basearch',
    baseurl       => 'https://repo.ius.io/7/$basearch/',
    enabled       => $ius_enabled,
    repo_gpgcheck => 0,
    gpgcheck      => 1,
    gpgkey        => 'https://repo.ius.io/RPM-GPG-KEY-IUS-7',
  }

  yumrepo { 'ius-debuginfo':
    descr         => 'IUS for Enterprise Linux 7 - $basearch - Debug',
    baseurl       => 'https://repo.ius.io/7/$basearch/debug/',
    enabled       => 0,
    repo_gpgcheck => 0,
    gpgcheck      => 1,
    gpgkey        => 'https://repo.ius.io/RPM-GPG-KEY-IUS-7',
  }

  yumrepo { 'ius-source':
    descr         => 'IUS for Enterprise Linux 7 - Source',
    baseurl       => 'https://repo.ius.io/7/src/',
    enabled       => 0,
    repo_gpgcheck => 0,
    gpgcheck      => 1,
    gpgkey        => 'https://repo.ius.io/RPM-GPG-KEY-IUS-7',
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
