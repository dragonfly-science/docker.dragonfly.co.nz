# Dragonfly docker files

There are some dragonfly dockers maintained in this repository, all based on ubuntu (switch branches to switch
your base ubuntu version). Dockers built here are available from https://docker.dragonfly.co.nz. The dockers
are:

1. `dragonfly-base` - Based on ubuntu, with New Zealand localisation and a deployhub user 
2. `dragonfly-tidyverse` - A basic R docker containing the recommended R packages and 
    R packages from the tidyverse
3.  `dragonfly-reports` - The tidyverse, latex, and enough R packages to process basic 
    Sweave files
4.  `dragonverse` - A fat desktop sized docker with Potsgres, GIS tools, and a range of R packages

The docker files have the ubuntu version in their name,  e.g., `dragonfly-reports-17.04` and are tagged with the date 
that they were pushed to the registry. To list the tags of the available images, you can visit the 
registry URL for each repository: e.g., https://docker.dragonfly.co.nz/v2/dragonfly-reports-17.04/tags/list


To use these images in Gorbachev, put something like the following in your `gorbachev.yaml` file:
```
docker: dragonfly-reports-17.04:2017-06-15
```
Your project will then be built with that image every time it runs on Gorbachev.

# Running in a docker context

To use a docker to run a particular project, you can use the following command:

```
docker run -it --rm --net=host --user=$$(id -u):$$(id -g) -v$$(pwd):/work -w /work DOCKER CMD
```
where `DOCKER` is the name of the docker that you want to run, and `CMD` is the command that you want
to be executed when the docker starts. This mounts the current directory into a directory called
`work` and the command will be run with the same user and group as in the host. Make sure
that you write any files that you want to keep somewhere under the work directory, otherwise
you wll lose them when the docker finishes.

# Rolling your own docker

The dockerfiles are examples of how to build your own docker images.  In this case,
R is built from the default version of the ubuntu repository. The R packages
are all pinned at particular versions, in order to minimise surprises. You can build
a dockerfile by running a command like the following:
```
docker build -t docker.dragonfly.co.nz/NAME:TAG PATH
 ```

Where `NAME` is the name you want to give your repository, the optional `TAG` allows
you to specify the version, and `PATH` is the path to the directory of the Dockerfile
(often times just `.`). Once you have happily built the docker, push it to the
dragonfly repository with:

```
docker push docker.dragonfly.co.nz/NAME:TAG 
```




