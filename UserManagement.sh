#!/bin/bash
user_add () {
	for i in `cat /tmp/userlist.txt`
		do if id $i &> /dev/null
		then
			echo "user exist!"
		else
			echo "user: $i doesn't exist and creating the user"
			useradd $i
			echo "password" | passwd --stdin $i
			echo "New user and password is created for: $i"
		fi
	done
}

user_del () {
	for i in `cat /tmp/userlist.txt`
		do if id $i &> /dev/null
		then
			echo "user exist: $i"
			userdel -r  $i
			echo "Deleted user: $i"
		fi
	done
}

user_archive () {
	DATE=$(date +%d-%m-%Y)
	BACKUP_DIR="/tmp/Backup"

	mkdir -p $BACKUP_DIR/$DATE

	for user in `more /tmp/workarea/userlist.txt`
	do 
		tar -zcvpf $BACKUP_DIR/$DATE/$user-$DATE.tar.gz /home/$user
	done

}

user_disable () {
	for i in `cat /tmp/userlist.txt`
		do if id $i &> /dev/null
		then
			echo "user exist: $i"
			usermod -L  $i
			chage -E0 $i
			usermod -s /sbin/nologin $i
			echo "Account is disabled for user: $i"
		fi
	done
}

echo "                  #####                    "
echo -e "Select the option to perform the specific operation: "
echo -e " 1> User Addition\n 2> User Deletion\n 3> Backup Operation\n 4> Disabling User\n"
read -p " Enter the no. to select the operation: " input
#echo "Selected option is $input"

if [ "$input" = 1 ]
then 
	user_add
elif [ "$input" = 2 ]
then
	user_del
elif [ "$input" = 3 ]
then
	user_archive
elif [ "$input" = 4 ]
then 
	user_disable	
else 
	echo "Wrong input is provided"
fi

