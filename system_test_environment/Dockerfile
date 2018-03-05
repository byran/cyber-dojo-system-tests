# this would be better starting from cyberdojofoundation/ruby
# but bundler seems broken in that image
FROM  cyberdojo/ruby
LABEL maintainer=byran@adgico.co.uk

COPY container_scripts/*.sh /
COPY container_scripts/Gemfile /
COPY container_scripts/Gemfile.lock /

RUN /setup.sh

CMD ["/entry_point.sh"]
