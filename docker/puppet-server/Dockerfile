FROM awltux/centos:6.7
MAINTAINER Chris Holman <awltux@chrisanddervilla.plus.com>
# add puppet labs repository to rpm
RUN rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
# Update yum with puppet labs metadata
RUN yum --assumeyes update
# Install the puppet server
RUN yum --assumeyes install puppet-server
# Tell puppet to keep the puppet server up to date
RUN puppet resource package puppet-server ensure=latest
# Append master puppet config
RUN puppet master --no-daemonize --genconfig >> /etc/puppet/puppet.conf
# Comment out depracated properties
RUN sed -i -- 's/^\([ ]*\)manifest =/\1#(DEPRACATED) manifest =/g' /etc/puppet/puppet.conf
RUN sed -i -- 's/^\([ ]*\)masterlog =/\1#(DEPRACATED) masterlog =/g' /etc/puppet/puppet.conf
RUN sed -i -- 's/^\([ ]*\)modulepath =/\1#(DEPRACATED) modulepath =/g' /etc/puppet/puppet.conf
RUN sed -i -- 's/^\([ ]*\)manifestdir =/\1#(DEPRACATED) manifestdir =/g' /etc/puppet/puppet.conf
RUN sed -i -- 's/^\([ ]*\)templatedir =/\1#(DEPRACATED) templatedir =/g' /etc/puppet/puppet.conf
# Make sure puppet master starts in daemon mode.
RUN sed -i -- 's/PUPPETMASTER_OPTS="master "/PUPPETMASTER_OPTS="master --daemonize "/g' /etc/init.d/puppetmaster
# Start the Puppet Master
RUN service puppetmaster start
VOLUME /mnt/docker
