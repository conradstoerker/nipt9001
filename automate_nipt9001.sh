#!/bin/bash

#FLOWPATH INPUTPATH OUTPUTPATH local paths
# DO NOT DELETE ANYTHING FROM STORAGEPATH!!!!!!!!!!!!!!!!!!!!!!

echo Making selinux Permissive
sudo setenforce 0
sudo getenforce

#SCRATCH='/mnt/scratch'

FLOWPATH='/mnt/scratch/devel/'
DATANAME='150423_COUNT_0015_AC6V7GANXX'
DATAPATH='/mnt/production_storage/runs/hiseq/${DATANAME}'
INPUTPATH='/mnt/scratch/data/'
OUTPUTPATH='/mnt/scratch/results/'
LOGPATH='/mnt/production_storage/workflows/docker'

#Container and Image names
CNAME='nipt9001'
IMGNAME='docker.io/conradstoerker/nipt9001'

#the first wget installs if you don't have it, the second will update your current docker
#echo Making sure you have the latest docker package...
#wget -qO- https://get.docker.com/ | sh
#sudo usermod -aG docker [your_user]
wget -N https://get.docker.com/ | sh

echo Restarting docker...
sudo service docker stop
sudo service docker start

#echo removing the container to be run if it exists...
#sudo docker rm -f $CNAME

#Needs to specify the number of cores and memory available, use -m [somenum] --cpuset="num1,num2,num3-num5"
echo running $IMGNAME...
sudo docker run --name ${CNAME} -v $INPUTPATH:$INPUTPATH  -v $OUTPUTPATH:$OUTPUTPATH -v $FLOWPATH:$FLOWPATH -v $DAT$


#echo removing the container and exiting...
#sudo docker rm -f $CNAME

#echo Enforcing selinux
#sudo setenforce 1
sudo getenforce
