FROM
MAINTAINER Chris Holman <awltux@chrisanddervilla.plus.com>
RUN rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
RUN yum update
RUN yum install puppet
RUN puppet resource package puppet-server ensure=latest

