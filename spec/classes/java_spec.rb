require 'spec_helper'

describe "java" do
  let(:facts) { default_test_facts }

  it do
    should include_class('boxen::config')

    should contain_package('jre-7u45').with({
      :ensure   => 'present',
      :alias    => 'java-jre',
      :provider => 'pkgdmg',
      :source   => 'https://d3pep6299hwdsh.cloudfront.net/puppet-java/jre-7u45-macosx-x64.dmg'
    })

    should contain_package('jdk-7u45').with({
      :ensure   => 'present',
      :alias    => 'java',
      :provider => 'pkgdmg',
      :source   => 'https://d3pep6299hwdsh.cloudfront.net/puppet-java/jdk-7u45-macosx-x64.dmg'
    })

    should contain_file('/test/boxen/bin/java').with({
      :source  => 'puppet:///modules/java/java.sh',
      :mode    => '0755',
      :require => 'Package[java]'
    })
  end
end
