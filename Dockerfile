############################################################
# Dockerfile to build NIPT9001 container images
# Begins with the start.sh script
# Based on centos
#
############################################################
# Set the base image to Centos
FROM centos:7

# File Author / Maintainer
MAINTAINER conrad stoerker

ENV STARTFILE https://raw.githubusercontent.com/conradstoerker/nipt9001/master/start.sh
ENV AUTOFILE https://raw.githubusercontent.com/conradstoerker/nipt-9001/master/automate_nipt9001.sh
ENV FLOWZIP workflow_NIPT9001.tar.gz

# Creating directories identical to the host, but only the ones we need
RUN mkdir /mnt/scratch
RUN mkdir /mnt/scratch/data
RUN mkdir /mnt/scratch/devel
RUN mkdir /mnt/scratch/results

RUN mkdir /mnt/production_storage
RUN mkdir /mnt/production_storage/runs
RUN mkdir /mnt/production_storage/runs/hiseq
RUN mkdir /mnt/production_storage/runs/hiseq/150423_COUNT_0015_AC6V7GANXX
RUN mkdir /mnt/production_storage/rnd
RUN mkdir /mnt/production_storage/rnd/results
RUN mkdir /mnt/production_storage/rnd/results/Docker_test
RUN mkdir /mnt/production_storage/workflows
RUN mkdir /mnt/production_storage/workflows/docker

VOLUME /mnt/scratch/data
VOLUME /mnt/scratch/devel
VOLUME /mnt/scratch/results
VOLUME /mnt/production_storage/runs/hiseq/150423_COUNT_0015_AC6V7GANXX
#VOLUME /mnt/production_storage/rnd/results/Docker_test
VOLUME /mnt/production_storage/workflows/docker

# Update the repository sources list
RUN yum -y update

# Install tools
#RUN yum groupinstall -y development
RUN yum install -y  postgresql-devel telnet perl java-1.8.0-openjdk-devel git

# Download the start.sh file
ADD ${STARTFILE} /mnt/scratch/
ADD ${AUTOFILE} /mnt/scratch/

#Running the start.sh script
CMD bash -C '/mnt/scratch/start.sh';'bash'
