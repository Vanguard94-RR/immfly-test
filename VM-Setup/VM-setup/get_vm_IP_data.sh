#! /bin/bash

#virsh create vm.xml

VMNAME=$(virsh list --name --state-running)
export VMNAME
#echo "$VMNAME"
#echo
VMMAC=$(virsh dumpxml "$VMNAME" | grep "mac address" | awk -F\' '{ print $2}')
export VMMAC
#echo "$VMMAC"
#echo
VMDOMINIP=$(virsh domifaddr "$VMNAME")
export VMDOMINIP
#echo "$VMDOMINIP"
#echo
VMIP=$(echo "$VMDOMINIP" | sed -nE 's/.* ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*/\1/p')
export VMIP
#printf "Vitual Machine IP\n"
printf "%s\n" "$VMIP"
