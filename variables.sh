#!/bin/bash
# Set the repeat status of entry
SET_STATUS=0;
# Set the color variable
yellow='\033[1;33m';
red='\033[1;31m';
# Clear the color after that
clear='\033[0m';
#function declerations 
reading_values () {
    read -p "$1 : " $2;
}
repeat_reading () {
    echo -e "$2$1$3"
}
confirm_variables () {
    echo -e "$1 : $2$3$4"
}
#looping the data insert
for (( i=0; i != 1 ;  ))
do
echo
if [ $SET_STATUS == 0 ]
then
echo 
# reading_values "Insert the Project Name (same as the git repo name) " PROJECTNAME;
reading_values "Insert the Project Name (same as the git repo name)" PROJECTNAME;
echo
reading_values "Enter the domain you want to deploy " YOURDOMAIN;
echo
reading_values "Insert the DB Name " DATABASENAME;
echo
reading_values "Insert the DB Password " DATABASEPASS;
echo 
reading_values "Insert the GIT_URL want to clone " GITURL;
echo
reading_values "Define the Branch you want to clone " BRNACHNAME;
echo
reading_values "Define the PHP Version you want to install (7.0,7.2,7.3,7.4,8 etc...)" VERSION;
echo
else
echo
repeat_reading "Insert the Project Name Correctly (same as the git repo name)..." ${red} ${clear}
reading_values "Project Name " PROJECTNAME;
echo
repeat_reading "Enter the domain you want to deploy Correctly..." ${red} ${clear}
reading_values "Domain Name " YOURDOMAIN;
echo
repeat_reading "Insert the DB Name Correctly..." ${red} ${clear}
reading_values "DB Name " DATABASENAME;
echo
repeat_reading "Insert the DB Password Correctly..." ${red} ${clear}
reading_values "DB Password " DATABASEPASS;
echo
repeat_reading "Insert the Git URL want to clone Correctly..." ${red} ${clear}
reading_values "Git URL " GITURL;
echo
repeat_reading "Define the Branch you want to clone Correctly..." ${red} ${clear}
reading_values "Branch Name " BRNACHNAME;
echo
fi
echo "Confirm the below Values are enterd correct"
echo "----------------------------------------------"
#declear a array of Varaibles Name
array1=(Project_Name Database_Name Database_Password Domain_Name Git_URL Branch_Name Version_Number);
array2=($PROJECTNAME $DATABASENAME $DATABASEPASS $YOURDOMAIN $GITURL $BRNACHNAME $VERSION);
#do the looping of the function with arguments
for (( i=0; i <7; i++ ))
    do
    confirm_variables ${array1[#!/bin/bash
# Set the repeat status of entry
SET_STATUS=0;
# Set the color variable]} ${yellow}${array2[i]}${clear}
done
echo 
echo "Enter Yes to Confirm else enter No to Re-enter the Details..."
echo
echo "Please Confirm Yes or No"
echo
PS3="Enter 1 For Yes Enter 2 For No...?: "
select STATUS1 in  Yes No
do
    case $STATUS1 in 
        Yes)
            echo
            echo "Configuration Successfully added..."
            i=1;
            break
            ;;
        No)
            echo "Re-enter the Configurations.."
            SET_STATUS=1;
            i=0;
            break;
            ;;
    esac
done
done
repeat_reading () {
    echo -e "$2$1$3"
}
confirm_variables () {
    echo -e "$1 : $2$3$4"
}
#looping the data insert
for (( i=0; i != 1 ;  ))
do
echo
if [ $SET_STATUS == 0 ]
then
echo 
# reading_values "Insert the Project Name (same as the git repo name) " PROJECTNAME;
reading_values "Insert the Project Name (same as the git repo name)" PROJECTNAME;
echo
reading_values "Enter the domain you want to deploy " YOURDOMAIN;
echo
reading_values "Insert the DB Name " DATABASENAME;
echo
reading_values "Insert the DB Password " DATABASEPASS;
echo 
reading_values "Insert the GIT_URL want to clone " GITURL;
echo
reading_values "Define the Branch you want to clone " BRNACHNAME;
echo
reading_values "Define the PHP Version you want to install (7.0,7.2,7.3,7.4,8 etc...)" VERSION;
echo
else
echo
repeat_reading "Insert the Project Name Correctly (same as the git repo name)..." ${red} ${clear}
reading_values "Project Name " PROJECTNAME;
echo
repeat_reading "Enter the domain you want to deploy Correctly..." ${red} ${clear}
reading_values "Domain Name " YOURDOMAIN;
echo
repeat_reading "Insert the DB Name Correctly..." ${red} ${clear}
reading_values "DB Name " DATABASENAME;
echo
repeat_reading "Insert the DB Password Correctly..." ${red} ${clear}
reading_values "DB Password " DATABASEPASS;
echo
repeat_reading "Insert the Git URL want to clone Correctly..." ${red} ${clear}
reading_values "Git URL " GITURL;
echo
repeat_reading "Define the Branch you want to clone Correctly..." ${red} ${clear}
reading_values "Branch Name " BRNACHNAME;
echo
fi
echo "Confirm the below Values are enterd correct"
echo "----------------------------------------------"
#declear a array of Varaibles Name
array1=(Project_Name Database_Name Database_Password Domain_Name Git_URL Branch_Name);
array2=($PROJECTNAME $DATABASENAME $DATABASEPASS $YOURDOMAIN $GITURL $BRNACHNAME);
#do the looping of the function with arguments
for (( i=0; i <7; i++ ))
    do
    confirm_variables ${array1[i]} ${yellow}${array2[i]}${clear}
done
echo 
echo "Enter Yes to Confirm else enter No to Re-enter the Details..."
echo
echo "Please Confirm Yes or No"
echo
PS3="Enter 1 For Yes Enter 2 For No...?: "
select STATUS1 in  Yes No
do
    case $STATUS1 in 
        Yes)
            echo
            echo "Configuration Successfully added..."
            i=1;
            break
            ;;
        No)
            echo "Re-enter the Configurations.."
            SET_STATUS=1;
            i=0;
            break;
            ;;
    esac
done
done