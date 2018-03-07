FROM  cyberdojo/system-test-environment
LABEL maintainer=byran@adgico.co.uk

COPY features/ /features/

ENV browser=chrome
