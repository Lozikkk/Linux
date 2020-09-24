# /bin/bash
function userAdd()
{
            read -r -p "Do you want add user?" choice
    if [[ $choice == y || $choice -eq yes ]]; then
                read -r -p "Enter user name: " user
                useradd $user
                read -r -p "Enter user id: " userid
                usermod -u $userid $user
                read -r -p "Enter user password: " userpass
                usermod -p $userpass $user
                        if [[ $? != 0 ]]; then
                echo "$?"
                echo "Error user allready exist"
        else
                echo "User complited"
        fi
    else
                echo "Good bay!!!"
    fi    
}
function userDell()
{
            read -r -p "Do you want delete user?" choice
    if [[ $choice == y || $choice -eq yes ]]; then
                read -r -p "Enter user name: " userdel
                userdel -r $user $userdel             
                        if [[ $? != 0 ]]; then
                echo "$?"
                echo "Error user allready exist"
        else
                echo "User complited"
        fi
    else
                echo "Good bay!!!"
    fi    
}
function userEdit()
{    
    read -r -p "Do you want edit user?" choice
    if [[ $choice == y || $choice -eq yes ]]; then
                read -r -p "Enter user name: " user
                usermod -l $user
                read -r -p "Change user name: " usermod
                usermod -l $usermod $user
                read -r -p "Enter user id: " userid
                usermod -u $userid $user
                read -r -p "Enter group id: " groupid
                groupmod -g $groupid $group                
                        if [[ $? != 0 ]]; then
                echo "$?"
                echo "Error user allready exist"
        else
                echo "User complited"
        fi
    else
                echo "Good bay!!!"
    fi       
}
function creatGroup()
{
 read -r -p "Do you want creat group?" choice
    if [[ $choice == y || $choice -eq yes ]]; then
                read -r -p "Enter group name: " group
                groupadd $group
                read -r -p "Enter group id: " groupid
                groupmod -g $groupid $group                
                        if [[ $? != 0 ]]; then
                echo "$?"
                echo "Error user allready exist"
        else
                echo "User complited"
        fi
    else
                echo "Good bay!!!"
    fi  
}
function addUsergroup()
{
read -r -p "Do you want add user to group?" choice
    if [[ $choice == y || $choice -eq yes ]]; then
                read -r -p "Enter group name: " group
                usermod $group
                read -r -p "Enter user to add: " user
                usermod -aG $group $user                
                        if [[ $? != 0 ]]; then
                echo "$?"
                echo "Error user allready exist"
        else
                echo "User complited"
        fi
    else
                echo "Good bay!!!"
    fi
}
function dropUsergroup()
{
    read -r -p "Do you want to drop user from group?" choice
    if [[ $choice == y || $choice -eq yes ]]; then
                read -r -p "Enter user name: " user
                gpasswd -d $user
                read -r -p "Enter group name: " group
                gpasswd -d $user $group                
                        if [[ $? != 0 ]]; then
                echo "$?"
                echo "Error user allready exist"
        else
                echo "User complited"
        fi
    else
                echo "Good bay!!!"
    fi
}
function showAllusers()
{
                echo "Edit user!!!\n"
                echo useredit
                cat /etc/passwd $useredit
}
function showMenu()
{
    exit=true
    while [[ $exit == true ]]
        do
            echo -e "1. Add user\n2. Dell user\n3. Edit user\n4. Create group (with gid)\n5. Add user to group\n6. Drop user from group\n7. Show all users\n0. Exit"
            read item
                case $item in
                    1) userAdd;
                    ;;
                    2) userDell;
                    ;;
                    3) userEdit;
                    ;;
                    4) creatGroup;
                    ;;
                    5) addUsergroup;
                    ;;
                    6)dropUsergroup;
                    ;;
                    7) showAllusers;
                    ;;
                    0) exit=false
                        echo "Good bay"
                        ;;
                    *) echo "Error invalid item"
                        exit 1
                esac
        done                

}

showMenu;