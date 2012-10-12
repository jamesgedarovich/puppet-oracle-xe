# = Class: oracle
#
# Manage Oracle Express Edition through Puppet
#
# == Parameters:
#
# == Actions:
#   Install Oracle Express Edition for Linux 64-bit
#
# == Requires:
#   - Module['Archive']
class oracle {
	$url = "http://download.oracle.com/otn/linux/oracle11g/xe/oracle-xe-11.2.0-1.0.x86_64.rpm.zip"

    Exec {
         path => "/home/vagrant/.rvm/gems/ruby-1.9.3-p194/bin:/home/vagrant/.rvm/gems/ruby-1.9.3-p194@global/bin:/home/vagrant/.rvm/rubies/ruby-1.9.3-p194/bin:/home/vagrant/.rvm/bin:/usr/lib64/ccache:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/vagrant/.rvm/bin:/sbin:/usr/sbin:/home/vagrant/.local/bin:/home/vagrant/bin"
     }

    file { '/usr/src/RedHat/RPMS/x64':
        ensure => directory
    }

    archive::download { "oracle-xe-11.2.0-1.0.x86_64.rpm.zip:
	    ensure        => present,
	    url           => $url,
		agent         => "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.16) Gecko/20120421 Firefox/11.0",
		cookie        => "gpw_e24=http%3A%2F%2Fwww.oracle.com%2F",
        timeout       => 300,
	    checksum      => false,
    }

    archive::extract { "oracle-xe-11.2.0-1.0.x86_64:
        ensure     => present,
        target     => "/usr/src/RedHat/RPMS/x64",
        require    => Archive::Download["oracle-xe-11.2.0-1.0.x86_64.rpm.zip]
    }

} 