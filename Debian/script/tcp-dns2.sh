#!/bin/bash
#Autor: Blanca I-I
#Añadir servidor DNS a la configuración TPC/IP del servidor
#Completa. Añade los dos servidores DNS al fichero /etc/resolv.conf

: > /etc/resolv.conf

#añadir los nameserver

sudo bash -c "echo nameserver 192.168.1.12 >>/etc/resolv.conf"
sudo bash -c "echo nameserver 192.168.1.13 >>/etc/resolv.conf"
