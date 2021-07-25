# Vagrantbox for open5GS

## Prerequisites

### Vagrant

You can install vagrant by following the steps provided here: https://www.vagrantup.com/docs/installation/

### Virtualbox

Please update the provider in the `Vagrantfile` with your favorite one.

For the Virtualbox provider you need to install virtualbox on your machine. Please follow install steps here: https://www.virtualbox.org/wiki/Linux_Downloads


## Update

Please update the RAM and CPU values found in `Vagrantfile` to best fit you system configuration.

```console
vb.memory = <memory in MB>
vb.cpus = <number of cpus>
```

## Configuration

* On free5gs-VM, edit amf.yml and upf.yml as described in https://open5gs.org/open5gs/docs/guide/01-quickstart/ (in **amf.yml** put the NGAP address = [Free5GSVM-IP], and in **upf.yml** GTPU Address = [Free5GSVM-IP]).


* Open the browser and connect to the [Free5gs-VM-IP]:3000 to access the WEBUI and insert all the UE info described within the UERANSIM-VM/UERANSIM/config/openfree5gs-ue.yml; If you want to use more UEs, add entries with incremental IMSI.


* On UERANSIM-VM, edit the **config/open5gs-gnb.yml** properly, as described in https://open5gs.org/open5gs/docs/guide/01-quickstart/. Edit the config/open5gs-ue.yml and set the gnb IP address.
* To use more UEs in UERANSIM-VM, use 
```console
cd UERANSIM/
sudo build/nr-ue -c config/openfree5gs-ue.yml -n 3.
```

## References
* Partially forked from [abousselmi/vagrant-free5gc](https://github.com/abousselmi/vagrant-free5gc)
* Open5GS: [open5GS](https://github.com/open5gs/open5gs)
