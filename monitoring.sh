# --- VARIABLES ---

# ARCHITECTURE and KERNEL VERSION
arch=$(uname -m)
kernel=$(uname -r)

# NUMBER OF PHYSICAL CORES
cores=$(nproc)

# NUMBER OF VIRTUAL CORES
v_cores=$(nproc --all --ignore=1)

# CURRENTLY AVAILABLE RAM ON THE SERVER AND PERCENTAGE OF USE
ca_ram=$(free -h | grep "Mem:" | tr -d "i" | awk '{print $4}')
total_ram=$(free -h | grep "Mem:" | tr -d "i" | awk '{print $2}')
piu_ram=$(free -m | grep "Mem:" | awk '{print $3*100/$2}')

# MEMORY AVAILABLE ON THE SERVER AND PERCENTAGE OF USE (DISK)
ca_disk=$(df -h --total | grep "total" | awk '{print $4}')
total_disk=$(df -h --total | grep "total" | awk '{print $2}')
piu_disk=$(df -h --total | grep "total" | awk '{print $5}')

# CURRENT PERCENTAJE OF USE OF THE CORES PER CATEGORY
core_use=$(top -n 1 -b | grep "%Cpu" | awk '{print $2+$4}')

# DATE AND TIME OF THE LAST REBOOT
last_reboot_date=$(who -b | awk '{print $3}')
last_reboot_hour=$(who -b | awk '{print $4}')

# IS LOGICAL VOLUME MANAGER (LVM) ACTIVE OR NOT?
lvm_use=$(lsblk --noheadings --output TYPE | grep -q lvm && echo "Yes" || echo "No")

# NUMBER OF ACTIVES CONNECTIONS (TCP)
tcp=$(grep 'TCP' /proc/net/sockstat | awk '{print($3)}')

# NUMBER OF USERS LOGGED IN TO THE SERVER
users=$(users | wc -w)

# SERVER IPv4 ADRESS AND MAC
ipv4=$(ip -4 address show enp0s3 | grep "inet" | awk '{print $2}' | cut -d "/" -f 1)
mac=$(ip a | grep "link/ether" | awk '{print $2}')

# NUMBER OF COMMANDS EXECUTED WITH SUDO
sudo_log=$(grep 'COMMAND' /var/log/sudo/sudo_config | wc -l)

# --- WRITE ALL COMMAND ---
wall "	¡Hola, amigos del Youtube! (...)

	I mean... HELLO, AMIGOS DEL DEBIAN!!!

	This is a message from your favorite superuser R41Z (I'm not G-R00T!),
	with some funzy info about the server. I hope you enjoy it.
	If not... I don't care! You will see it again in 10 minutes.

		- Architecture:					$arch
		- Kernel:						$kernel
		- Physical cores:				$cores
		- Virtual cores:i				$v_cores
		- Currently available RAM:		$ca_ram / $total_ram
		- RAM percentaje in use:		$piu_ram%
		- Available disk storage:		$ca_disk / $total_disk
		- Disk storage used:			$piu_disk
		- Current cores use:			$core_use%
		- Last reboot:					$last_reboot_date $last_reboot_hour
		- LMV use:						$lvm_use
		- Connexions TCP:				$tcp
		- User log:						$users
		- IPv4:							$ipv4
		- MAC:							$mac
		- Commands executed with sudo:	$sudo_log
		"
