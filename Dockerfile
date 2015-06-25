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

ENV THISR http://dl.fedoraproject.org/pub/epel/7/x86_64/
ENV STARTFILE https://raw.githubusercontent.com/conradstoerker/nipt9001/master/start.sh
ENV FLOWZIP workflow_NIPT9001.tar.gz

# Creating directories identical to the host, but only the ones we need
RUN mkdir /mnt/scratch
RUN mkdir /mnt/scratch/data
RUN mkdir /mnt/scratch/devel
RUN mkdir /mnt/scratch/devel/NIPT9001
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
VOLUME /mnt/scratch/devel/NIPT9001
VOLUME /mnt/scratch/results
VOLUME /mnt/production_storage/runs/hiseq/150423_COUNT_0015_AC6V7GANXX
#VOLUME /mnt/production_storage/rnd/results/Docker_test
VOLUME /mnt/production_storage/workflows/docker

# Update the repository sources list
RUN yum -y update

# Link Hard Coding
RUN ln -s /mnt/scratch/devel/NIPT9001 /mnt/scratch/progenity_analysis-1.0
# Install Tools
RUN yum install -y postgresql-devel telnet perl java-1.8.0-openjdk-devel git python
RUN yum install -y gnuplot ImageMagick ghostscript libxslt libxslt-devel libxml2 libxml2-devel
RUN yum install -y ncurses ncurses-devel gcc libtiff libtiff-devel bzip2 bzip2-devel zlib zlib-devel
RUN yum install -y perl-XML-Dumper perl-XML-Grove perl-XML-LibXML perl-XML-LibXML-Common perl-XML-Twig
RUN yum install -y perl-XML-LibXML-Common perl-XML-NamespaceSupport perl-XML-Parser perl-XML-SAX
RUN yum install -y "perl(Compress::Zlib)" "perl(Archive::Tar)"
RUN yum install -y perl-XML-Simple perldoc cpan epel-release
RUN yum install -y R

# Download necessary files
ADD ${STARTFILE} /mnt/scratch/
RUN chmod +x /mnt/scratch/start.sh

#Running the start.sh script, however this can also be done using the run command for more control
#CMD bash -C '/mnt/scratch/start.sh';'bash'
