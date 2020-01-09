#!/bin/bash

#Actualizar fuente de repositorios
sudo apt-get update
#Ahora instalaremos bind9
dpkg -s bind9 &> /dev/null
	if test $? -ne 0
		then 
			sudo apt-get install -y bind9
		else
			echo "Bind9 instalado"
	fi

#Comprobamos si el servicio DNS esta escuchando
sudo netstat -ltn|tr -s ' '|cut -d ' ' -f4|cut -d ':' -f2|grep -w 53 >>/dev/null
if test $? -ne 0
then
 	echo "Problemas Bind9 no está levantado"
else
 	echo "Configurando Servidor DNS ...."
fi

#Ahora instalaremos apache
sudo apt-get update
dpkg -s apache2 &> /dev/null
	if test $? -ne 0
		then 
			sudo apt-get install -y apache2
		else
			echo "apache instalado"
	fi

#dig y nslookup
sudo apt-get install -y dnsutils

