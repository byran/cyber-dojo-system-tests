FROM  cyberdojo/system-test-environment
LABEL maintainer=byran@adgico.co.uk

COPY tests/ /tests/

ENV browser=chrome
