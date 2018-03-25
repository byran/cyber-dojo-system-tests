FROM  cyberdojo/system-test-environment
LABEL maintainer=byran@adgico.co.uk

COPY features/ /tests/features/

ENV browser=chrome
