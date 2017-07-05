#!/bin/bash

export BD=~/workspace/bosh-deployment
export DEPLOY=~/deployments/lab9

bosh2 update-cloud-config $BD/vsphere/cloud-config.yml \
  -o $BD/misc/dns.yml \
  -o $DEPLOY/lab09-stub.yml \
  -v network_name="Lab09-NetH" \
  -v internal_dns=[172.29.0.5] \
  -v az=Lab09-Cluster01 \
  -v subnet_id=Lab09-NetH \
  -v internal_cidr=172.28.98.0/24 \
  -v internal_gw=172.28.98.1 \
  -v vcenter_cluster=Lab09-Cluster01
  
