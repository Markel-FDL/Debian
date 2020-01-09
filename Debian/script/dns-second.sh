#!/bin/bash
#Autor: Blanca I-I
#Configuracion servicio DNS
#copia de seguridad del fichero de zonas
sudo cp /etc/bind/named.conf.local /etc/bind/named.conf.local.vo
#
#subir mi fichero de zonas al servidor 
sudo cp /vagrant/config/dns2/named.conf.local /etc/bind/named.conf.local
#copia de seguridad del fichero de zonas
sudo cp /etc/bind/named.conf.local /etc/bind/named.conf.local.vo
#
#subir mi fichero de zonas al servidor
sudo cp /vagrant/config/dns/named.conf.local /etc/bind/named.conf.local
#subir mi fichero de definición de la zona site1.lcoal al servidor
sudo cp /vagrant/config/dns/db.site1.local /etc/bind/db.site1.local
echo "Reiniciamos Bind..."
#Completa el comando para reiniciar el servicio
sudo systemctl restart bind9