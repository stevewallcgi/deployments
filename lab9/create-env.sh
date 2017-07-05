#!/bin/bash

# BOSH DEPLOYMENT directory
export BD=~/workspace/bosh-deployment

bosh2 create-env $BD/bosh.yml \
  --state=lab09-bosh-init-state.json \
  --vars-store=./creds.yml \
  -o $BD/vsphere/cpi.yml \
  -o $BD/misc/dns.yml \
  -v director_name=steve-wall-test \
  -v internal_cidr=172.28.98.0/24 \
  -v internal_gw=172.28.98.1 \
  -v internal_ip=172.28.98.50 \
  -v network_name="Lab09-NetH" \
  -v vcenter_dc=Lab09-Datacenter01 \
  -v vcenter_ds=nfs-lab09-vol1 \
  -v vcenter_ip=172.29.0.11 \
  -v internal_dns=[172.29.0.5] \
  -v vcenter_user="lab09admin@lab.ecsteam.local" \
  -v vcenter_password="Ecsl@b99" \
  -v vcenter_templates=steve-wall-bosh-templates \
  -v vcenter_vms=steve-wall-bosh-vms \
  -v vcenter_disks=steve-wall-bosh-disks \
  -v vcenter_cluster=Lab09-Cluster01

bosh2 -e 172.28.98.50 --ca-cert <(bosh2 int ./creds.yml --path /director_ssl/ca) alias-env lab09
