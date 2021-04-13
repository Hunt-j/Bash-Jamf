#!/bin/bash

name=$(hostname)


# Adds "P-" to the beginning of the name
pname=$( echo $name | awk '{print "P-"$0}' )
P="P-"
P2="P-P-"
P3="P-P-P-"

if [[ "$name" == *"$P"* ]]; then

    if [[ "$name" == *"$P2"* ]]; then

        if [[ "$name" == *"$P3"* ]]; then

           cname=$( echo $name | sed 's/P-P-P-/P-/g' )
           echo "this is cname" $cname 
           sudo /usr/local/bin/jamf setComputerName -name $cname
           exit
        fi

        bname=$( echo $name | sed 's/P-P-/P-/g' )
        echo "this is bname" $bname
        sudo /usr/local/bin/jamf setComputerName -name $bname
        exit
    
    else
        echo "Name Correctly Already"
    fi

else
# Set the ComputerName, HostName and LocalHostName
    sudo /usr/local/bin/jamf setComputerName -name $pname
fi