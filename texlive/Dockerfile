FROM docker.dragonfly.co.nz/dragonfly-base-16.04
# Latex
RUN apt-get update && \
    apt-get install -y --no-install-recommends texlive-full biber && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-add-repository multiverse && \ 
    apt-get update && \
    apt-get install -y msttcorefonts && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY fonts/ /usr/local/share/fonts/                                        
                                                                           
RUN apt-get update && \                                                    
    apt-get install -y debhelper fakeroot build-essential lintian devscripts && \                      
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*         
                                                                           
