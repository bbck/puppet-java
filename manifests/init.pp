# Public: installs java jre-7u51
#
# Examples
#
#    include java
class java {
  include boxen::config

  $jre_url = 'https://d3pep6299hwdsh.cloudfront.net/puppet-java/jre-7u51-macosx-x64.dmg'
  $jdk_url = 'https://d3pep6299hwdsh.cloudfront.net/puppet-java/jdk-7u51-macosx-x64.dmg'
  $wrapper = "${boxen::config::bindir}/java"

  package {
    'jre-7u51':
      ensure   => present,
      alias    => 'java-jre',
      provider => pkgdmg,
      source   => $jre_url ;
    'jdk-7u51':
      ensure   => present,
      alias    => 'java',
      provider => pkgdmg,
      source   => $jdk_url ;
  }

  file { $wrapper:
    source  => 'puppet:///modules/java/java.sh',
    mode    => '0755',
    require => Package['java']
  }
}
