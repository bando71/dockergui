# dockergui
FROM phusion/baseimage:0.9.17
MAINTAINER Daniel Guerra

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################
# Set correct environment variables
ENV LC_ALL=C.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 TERM=xterm


# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################
COPY ./files/ /tmp/
RUN chmod a+x /tmp/install/install.sh
RUN /tmp/install/install.sh
RUN rm -r /tmp/install