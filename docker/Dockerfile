FROM       fedora:22
RUN        dnf -y install wget gcc-c++ make ruby-devel findutils git ruby && \
           groupadd -r dev && useradd -g dev -u 1000 dev
USER       dev
ENV        HOME=/home/dev LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 PATH=$PATH:/home/dev/bin
RUN        gem install -N rake bundle && \
           git clone https://github.com/paulojeronimo/sislegis-site $HOME/sislegis-site && \
           cd $HOME/sislegis-site && rake setup && \
           cp $HOME/.gem/ruby/gems/oga-0.3.4/ext/c/liboga.so $HOME/.gem/ruby/gems/oga-0.3.4/lib
RUN        gem contents awestruct | grep auto.rb | xargs sed -i "s/^\(.*force_polling =\).*/\1 true/"
EXPOSE     4242
VOLUME     $HOME/sislegis-site
WORKDIR    $HOME/sislegis-site
CMD        [ "/bin/bash" ]
