# Using these files

- Install the latest docker version version 
  http://docs.docker.com/installation/ubuntulinux/

  `curl -s https://get.docker.io/ubuntu/ | sudo sh`

- Add yourself to the docker group and logout and in again

- run make


## Notes

### Running the registry server locally

    docker run -d -p 5000:5000 -v /var/docker/registry:/registry -e STORAGE_PATH=/registry -e STANDALONE=true registry

Use docker.dragonfly.co.nz.conf nginx config file (for nginx > 1.3.9)
