
curl https://raw.github.com/gist/1588091/8b7b7a203074231f3dc75bdee48b3017078fb621/CentOS-Base.repo -o /etc/yum.repos.d/CentOS-Base.repo
curl https://raw.github.com/gist/1588091/2e5ab750cd0603dd7210ea7a999d15f9aadae711/epel.repo -o /etc/yum.repos.d/epel.repo

rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

yum -y groupinstall 'Development Tools' 'Additional Development'
yum -y install readline readline-devel ncurses-devel gdbm-devel glibc-devel tcl-devel openssl-devel curl-devel expat-devel db4-devel byacc gitolite sqlite-devel gcc-c++ libyaml libyaml-devel libffi libffi-devel libxml2 libxml2-devel libxslt libxslt-devel libicu libicu-devel system-config-firewall-tui python-devel

curl -O http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.gz
tar xzvf ruby-1.9.3-p0.tar.gz
cd ruby-1.9.3-p0
./configure --enable-shared --disable-pthread
make
make install

gem update --system
gem update

adduser --shell /bin/bash --create-home --home-dir /home/gitlab gitlab

su gitlab
ssh-keygen -t rsa
su
adduser --system --shell /bin/sh --comment 'gitolite' --create-home --home-dir /home/git git
cp /home/gitlab/.ssh/id_rsa.pub /home/git/gitlab.pub
su git
gl-setup ~/gitlab.pub

usermod -a -G git gitlab
chmod -R g+rwX /home/git/repositories/
chmod g+r /home/git
