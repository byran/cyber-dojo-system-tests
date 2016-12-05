FROM cyberdojo/system-test-environment
MAINTAINER Byran Wills-Heath <byran@adgico.co.uk>

COPY tests/ /tests/

ENV browser=chrome
