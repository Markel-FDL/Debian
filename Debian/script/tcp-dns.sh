#!/bin/bash
#Autor: Blanca I-I
#Añadir servidor DNS a la configuración TPC/IP del servidor

: > /etc/resolv.conf

#añadir los nameserver

sudo bash -c "echo nameserver 192.168.1.12 www.markel.local >>/etc/resolv.conf"

#Deshabilitar el servidor virtual por defecto
sudo a2dissite /etc/apache2/sites-enabled/000-default.conf
#Reiniciar para que el cambio tenga efecto
sudo systemctl reload apache2
#Son enlaces sinbolicos
#Para crear estos ficheros enlace: a2ensite nombre_servidor
#Para borrar estos ficheros enlace: a2dissite nombre_servidor

#Ahora crearemos las carpetas y archibos de las dos paginas web
#La primera será: markel.local
sudo mkdir /var/www/markel
sudo chmod 777 /var/www/markel
sudo touch /var/www/markel/index.html
#Dentro de index.html crearemos la pagina web
echo '<html>
<head>
<body>
	<h1>Hola</h1>
	<p>Me llamo Markel y __________</p>
</body>
</head>
</html>' > /var/www/markel/index.html
#La segunda será: hacernada.local
sudo mkdir /var/www/hacernada
sudo chmod 777 /var/www/hacernada
sudo touch /var/www/hacernada/index.html
#Dentro de index.html crearemos la pagina web
echo '<html>
<head>
<body>
	<h1>Adios</h1>
	<p>Me gusta hacer nada y __________</p>
</body>
</head>
</html>' > /var/www/markel/index.html
#Tenemos que conseguir dos nuevos 000-default.conf.
#Para ello, copiaremos el que tenemos en /etc/apache2/sites-available
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default2.conf
#Porque tenemos que tener 1 por pagina web

#Empezaremos modificar los ficheros 000-default.conf y 000-default2.conf
#Primero, el ServerName
#pagina Markel
sed -i 's|#ServerName www.example.com|ServerName www.markel.local|' /etc/apache2/sites-available/000-default.conf
#pagina Hacernada
sed -i 's|#ServerName www.example.com|ServerName www.hacernada.local|' /etc/apache2/sites-available/000-default2.conf
