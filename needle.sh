#injection.sh





#!/bin/bash
printf '          \e[7m\e[96m
             ___  __  ___    __        
| |\ |    | |__  /  `  |  | /  \ |\ |  
| | \| \__/ |___ \__,  |  | \__/ | \|  
                                       
___  __   __              ___          
 |  /  \ /  \ |    |__/ |  |           
 |  \__/ \__/ |___ |  \ |  |           \n\e[0m'
echo -e '\e[91m
|________|___________________|_                 
|        | | | | | | | | | | | |________________
|________|___________________|_|                
|        |                   |                  


\e[0m'

#!/bin/bash
#code injector

file_with_code="$2"
file_to_inject="$3" 
extra2="$4"

if [ $1 == "1" ];
then
    echo "File injector!"
    sleep 2
    echo "Reading the code..."
    sleep 5
    echo "Injecting the code..."
    sleep 6
    
    change_me="$5"
    change_me_to="$6"

    if [ $extra2 == "solve" ];
    then
        echo "Solve mode active"
    
        echo "Now replacing $5 with $6"
    
        sed -i "s/$change_me/$change_me_to/g" $file_to_inject
    
        echo "Done!"
    
    fi
    cat $file_with_code >> $file_to_inject
    echo "File injection finished!"
    echo "
    output-logs
    
    ####CODE####
    $file_with_code
    ####CODE####
    was injected to $file_to_inject
    "
fi

code="$2"
extra2="$4"

if [ $1 == "2" ];
then
    echo "File Injectior!"
    sleep 2
    echo "Injecting the code..."
    sleep 5
    echo $code >> $file_to_inject
    echo "Code injection finished!"
    sleep 1
    change_me="$7"
    change_me_to="$8"

    if [ $extra2 == "solve" ];
    then
        echo "Solve mode active"
    
        echo "Now replacing $5 with $6"
    
        sed -i "s/$change_me/$change_me_to/g" $file_to_inject
    
        echo "Done!"
    
    fi

    
    
    
    echo "
    output-logs
    
    ####CODE####
    $code
    ####CODE####
    was injected to $file_to_inject
    "
fi


#extra

