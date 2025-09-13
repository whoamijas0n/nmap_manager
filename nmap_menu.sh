clear
echo -e "\e[1;31m$(cat lotit)\e[0m"
echo ""
read -p "[-] Ingrese la IP o rango a escanear: " ip
clear

# Carpetas para almacenar la informacion

mkdir Auditoria_$(date +%Y-%m-%d)

# Bucle para repetir el menu hasta que se decida salir

until [ "$optScan" = "8" ]
do

echo -e "\e[1;31m$(cat lotit)\e[0m"
echo ""
echo -e "\033[33m[-] Seleccione el tipo de escaneo que desea realizar\033[0m"
echo ""

echo -e "\033[33m[-] Menu de opciones:\033[0m"
echo ""
echo "[0] Descubrimiento de hosts"
echo "[1] Escaneo de puertos comunes"
echo "[2] Escaneo completo de puertos TCP"
echo "[3] Escaneo de servicios y versiones"
echo "[4] Detección de sistemas operativos"
echo "[5] Escaneo UDP"
echo "[6] Escaneos con NSE"
echo "[7] Escaneo agresivo"
echo "[8] Salir"

echo ""
read -p "[-] Elige una opcion: " optScan
echo ""

# Carpetas para almacenar la informacion
cd Auditoria_$(date +%Y-%m-%d)


# Aqui esta el menu de casos segun la opcion

  case $optScan in

		"0")
		echo -e "\033[31m[-] Iniciando escaneo...\033[0m"
		echo ""		
		mkdir 00_HostScan
		nmap -sn $ip -oN 00_HostScan/hosts.txt
		clear
		echo -e "\033[32m[-] escaneo completo, revise la carpeta\033[0m"
		cd ..
		;;

		"1")
		echo -e "\033[31m[-] Iniciando escaneo...\033[0m"
		echo ""
		mkdir 01_PortScan
		sudo nmap -sS $ip --top-ports 100 -oN 01_PortScan/ports.txt
		clear
		echo -e "\033[32m[-] escaneo completo, revise la carpeta\033[0m"
		cd ..
		echo ""
		;;

                "2")
                echo -e "\033[31m[-] Iniciando escaneo...\033[0m"
                echo ""
                mkdir 02_FullTCP
                sudo nmap -sS -p- $ip -oN 02_FullTCP/full_tcp.txt
                clear
                echo -e "\033[32m[-] escaneo completo, revise la carpeta\033[0m"
                cd ..
		echo ""
                ;;

                "3")
                echo -e "\033[31m[-] Iniciando escaneo...\033[0m"
                echo ""
                mkdir 03_ServiceScan
                nmap -sV $ip -oN 03_ServiceScan/services.txt
                clear
                echo -e "\033[32m[-] escaneo completo, revise la carpeta\033[0m"
                cd ..
		echo ""
                ;;

                "4")
                echo -e "\033[31m[-] Iniciando escaneo...\033[0m"
                echo ""
                mkdir 04_OsDetection
                sudo nmap -O $ip -oN 04_OsDetection/os_detection.txt
                clear
                echo -e "\033[32m[-] escaneo completo, revise la carpeta\033[0m"
                cd ..
		echo ""
                ;;  

                "5")
                echo -e "\033[31m[-] Iniciando escaneo...\033[0m"
                echo ""
                mkdir 05_UDPScan
                sudo nmap -sU --top-ports 20 $ip -oN 05_UDPScan/udp.txt
                clear
                echo -e "\033[32m[-] escaneo completo, revise la carpeta\033[0m"
                cd ..
		echo ""
                ;;  

                "6")
                echo -e "\033[31m[-] Iniciando escaneo...\033[0m"
                echo ""
                mkdir 06_VulnScan    
                nmap --script vuln $ip -oN 06_VulnScan/vuln.txt
                clear
                echo -e "\033[32m[-] escaneo completo, revise la carpeta\033[0m"
                cd ..
		echo ""
                ;;  

                "7")
                echo -e "\033[31m[-] Iniciando escaneo...\033[0m"
                echo ""
                mkdir 07_HardScan
                nmap -A -p- $ip -oN 07_HardScan/hardscan.txt
                clear
                echo -e "\033[32m[-] escaneo completo, revise la carpeta\033[0m"
                cd ..
		echo ""
                ;;  

		"8")
		clear
		echo -e "\033[32m[-] Volviendo al menu principal...\033[0m"
		echo ""
		;;
		
		*)
		clear
		cd ..
                echo -e "\033[31m[-] Opción inválida $REPLY\033[0m"
		echo ""
		;;

                esac

done
