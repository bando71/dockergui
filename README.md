#Docker dockergui

## Description:
dockergui is a base image based of phusion's base image version 0.9.16 with ssh disabled.
  
 
This Docker image makes it possible to use any X application  on a headless server through a modern web browser such as chrome. The x11rdp branch using X11rdp to 
run its virtual X server, while the Xvnc using ofcourse Xvnc for it's virtual X server. The x11rdp branch is experimental and sometimes has drawing issues. Both branches
use rdp for communication between the container and the client.
Additionally xrdp is installed and the container can be accessed using any rdp client. You can access the web interface by going to port 8080 or rdp via port 3389.
  
  
## How to use this image:
  
### Example docker file:
  
```
# Builds a docker gui image
FROM danielguerra/dockergui

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Set environment variables

# User/Group Id gui app will be executed as default are 99 and 100
ENV USER_ID=99
ENV GROUP_ID=100

# Gui App Name default is "GUI_APPLICATION"
ENV APP_NAME GUI_APPLICATION

# Default resolution, change if you like
ENV WIDTH=1280
ENV HEIGHT=720

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################
RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe restricted' > /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates main universe restricted' >> /etc/apt/sources.list

# Install packages needed for app

#########################################
##          GUI APP INSTALL            ##
#########################################

# Install steps for X app
RUN apt-get update
RUN apt-get install mypackages

# Copy X app start script to right location
COPY startapp.sh /startapp.sh

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################

# Place whater volumes and ports you want exposed here:

```
  
## Environment Variables
  
The dockergui image uses serveral optional enviromnet variable. All the ones listed in the example above plus the following:

####`TZ`
This environment variable is used to set the [TimeZone] of the container.

[TimeZone]: http://en.wikipedia.org/wiki/List_of_tz_database_time_zones
   
## Build from docker file (Info only, not required.):

```
git clone -b xrdp --depth=1 https://github.com/danielguerra/dockergui.git 
cd dockergui
docker build --rm=true -t dockergui . 
```
