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

# LVM IS ACTIVE OR NOT

# NUMBER OF ACTIVES CONNECTIONS (TCP)

# NUMBER OF USERS LOGGED IN TO THE SERVER

# SERVER IPv4 ADRESS AND MAC

# NUMBER OF COMMANDS EXECUTED WITH SUDO

# --- WRITE ALL COMMAND ---
wall "	¡Hola, amigos del Youtube! (...)

	I mean... HELLO, AMIGOS DEL DEBIAN!!!

	This is a message from your favorite superuser 'r41z-r00t'
	with some funzy info about the server. I hope you enjoy it.
	If not... I don't care! You will see it again in 10 minutes.

		- Architecture:				$arch
		- Kernel:					$kernel
		- Phisical cores:			$cores
		- Virtual cores:			$v_cores
		- Currently available RAM:	$ca_ram / $total_ram
		- RAM percentaje in use:	$piu_ram%
		- Available storage:		$ca_disk / $total_disk
		- Storage used:				$piu_disk
		- Current cores use:		$core_use%
		"
