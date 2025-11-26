# Blog Archive on Openshift

This is for deploying the static apache+tequila server on the openshift 
project `blogs-wiki-prod`.

The image used on the cluster is built using the `Dockerfile` from the 
[GitLab repository](https://gitlab.epfl.ch/cangiani/blogarchive.git).

### Usage

If the defaults set int `config.erb` are not correct, then override them
in `.env`. For example, in my case, I need to change the base keybase directory.

If you chang something in `apache-tequila` and you need upgrade the docker image
then please update the IMGVERSION variable in `config.erb`, git push and
rebuild/push the image with `make push`

In order to deploy to Openshift 4:
 1. login into https://console-openshift-console.apps.ocpitsp0001.xaas.epfl.ch/k8s/cluster/projects
 2. copy the login command by clicking on your name on the top right end corner
 3. execute the login command you have just copied (it looks like `oc login --token=YOUR_TOKEN --server=https://api.ocpitsp0001.xaas.epfl.ch:6443`)
 4. deploy to the server with `make install`