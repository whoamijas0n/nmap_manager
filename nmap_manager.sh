clear

until [ "$opcion" = "2" ]
do

bash log.sh

echo ""
echo -e "\033[33m[-] Menu de opciones:\033[0m"
echo ""
echo "[0] Instalar dependencias"
echo "[1] Auditorias de red con Nmap"
echo "[2] Salir"
echo ""
read -p "[-] Elige una opcion: " opcion

echo ""

# Menu de casos 


    case $opcion in
	"0")
            until [ "$host" = "3" ]
            do
	    clear
	    echo -e "\e[1;31m$(cat lode)\e[0m"
	    echo ""
	    echo -e "\033[33m[-] Host disponibles:\033[0m"
	    echo ""
	    echo "[1] Debian / Ubuntu / Kali linux"
	    echo "[2] BlackArch / Arch linux"
	    echo "[3] Salir"
		echo ""
	    read -p "[-] Elige una opcion:  " host
	    echo ""
		case $host in
		    "1")
			bash requeriments_deb.sh 
			clear
			echo -e "\033[32m[-] Dependencias instaladas correctamente\033[0m"
			echo ""
			break
			;;
	            "2")
			bash requeriments_arch.sh
			clear 
			echo -e "\033[32m[-] Dependencias instaladas correctamente\033[0m"
			echo ""
			break
			;;
		    "3")
			clear
			echo -e "\033[31m[-] Regresando al menu principal...\033[0m"
			echo ""		
			;;
	             *) 
			clear
           		echo -e "\033[31m[-] Opción inválida $REPLY\033[0m"
        		echo ""
           		;;	
	    	esac
	done
	    ;;
        "1")
	    clear
	    echo -e "\e[1;31m$(figlet -f slant "Escaneo de Red")\e[0m"
	    #echo -e "\033[31m[-] Ejecutando Opción 1...\033[0m"
            echo ""
	    bash nmap_menu.sh
	    clear
	    echo -e "\033[31m[-] Escaneo completado correctamente...\033[0m"
	    echo ""
            ;;
   
        "2")
	    echo -e "\033[31m[-] Saliendo del menu, gracias por usar Nmap Manager\033[0m"
	    echo ""    
            ;;

        *)
	    clear
	    echo -e "\033[31m[-] Opción inválida $REPLY\033[0m"
            echo ""
            ;;
    esac
done
