class ibm_mq::install (
   $manage_user            = true,
   $manage_group           = true,
   $user                   = $::ibm_mq::params::user,
   $group                  = $::ibm_mq::params::group,
) inherits ::ibmm_mq::params {
   notify { 'ibm_mq::install': }

# taken from:
# http://sadockobeth.blogspot.co.uk/2014/03/how-to-install-ibm-websphere-mq-75-on.html

   
# Setup WebSphere user and Group
  validate_bool($manage_group)
  if $manage_group {
    group { $group:
      ensure  => present,
      require => Package['ibm_mq']
    }
  }
  validate_bool($manage_user)
  if $manage_user {
    user { $user:
      ensure  => present,
      gid     => $group,
      require => Package['ibm_mq']
    }
  }
  
#TODO: Set the users password

# Kernel Configuration Parameters
   ini_setting { 'kernel.shmmni',
      path => '/etc/sysctl.conf',
	  section => '',
	  setting => 'kernel.shmmni',
	  value => '4096'
   }
# Read and Accept License
# Install WebSphere MQ Components
# Post Installations
# Verifying Installation
# Start WebSphere MQ Explorer GUI   
}
