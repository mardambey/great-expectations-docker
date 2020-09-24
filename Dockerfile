FROM python:3-slim

ARG BUILD_DATE                                                                                                                                                       
ARG VCS_REF                                                                                                                                                          
                                                                                                                                                                     
ADD ./requirements.txt ./

RUN apt-get update -yqq \
  && apt-get install --no-install-recommends -yqq ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.cache \
  && pip install --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt  

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupadd -g ${GROUP_ID} ge &&\
    useradd -l -u ${USER_ID} -g ge ge &&\
    install -d -m 0755 -o ge -g ge /home/ge

USER ge
# Run great_expectations
CMD ["great_expectations"]
