#!/bin/bash

#Grabs the hostname
name=$(hostname)


#Appends "P-" to the hostname
pname=$( echo $name | awk '{print "P-"$0}' )

#Just some variables in case this runs on the same machines more than once
P="P-"
P2="P-P-"
P3="P-P-P-"


#If loops to determine if the machine needs "P-" on the name, if it needs excess "P-"s removed, or if it's already properly named.
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
        echo "Named Correctly Already"
    fi

else

    sudo /usr/local/bin/jamf setComputerName -name $pname
fi
