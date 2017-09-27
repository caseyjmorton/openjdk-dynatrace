FROM openjdk:8-slim

RUN apt-get update && \
	apt-get -y install wget

# Download and install dynatrace
RUN wget https://files.dynatrace.com/downloads/OnPrem/dynaTrace/6.5/6.5.0.1289/dynatrace-wsagent-6.5.0.1289-linux-x86-64.tar -P /tmp && \
	tar -xvf /tmp/dynatrace-wsagent-6.5.0.1289-linux-x86-64.tar -C /tmp && \
	cd opt && \
	/tmp/dynatrace-wsagent-6.5.0.1289-linux-x64.sh && \
	rm -rf /tmp/* && \
	cd .. 

ADD docker_entrypoint.sh .
RUN chmod 770 docker_entrypoint.sh

ENTRYPOINT [ "./docker_entrypoint.sh" ]
