#!/bin/bash
#Script en Bash para realizar la extraccion de todos los artefactos de un sistema Linux
figlet SCRIPT DE ARTEFACTOS EN LINUX

#CREACION DE TODOS LOS DIRECTORIOS NECESARIOS


mkdir  forense 2>/dev/null
mkdir  forense/logs 2>/dev/null
touch fechasistema.txt
touch equipo.txt
touch cpu.txt
touch usuariosregistrados.txt
touch procesosexec.txt
touch arbolprocesos.txt
touch mountdiscos.txt
touch estadisticadisco.txt
touch moduloskernel.txt
touch parametroskernel.txt
touch actividadsistema.txt
touch entornosistema.txt
touch variablesentorno.txt
touch serviciosopen.txt
touch passwd.txt
touch group.txt
touch lastsession.txt
touch quienusuario.txt
touch quiensesionlast.txt
touch quegrupo.txt
touch conexionesnow.txt
touch interfazred.txt
touch sockets.txt
touch puertosabiertos.txt
touch tablaenrutamiento.txt
touch arp.txt
touch interfazinfo.txt
touch hostsok.txt
touch hostsdeny.txt
touch dnsstatic.txt
touch gatedns.txt
touch SUIDGUID.txt
touch salidaparticiones.txt
touch ultimosession.txt
touch moduloscargados.txt
touch historial.txt
touch memoriaejecucion.txt
# REALIZACION DE TODOS LOS ARTEFACTOS 

echo "● Copiar el contenido de las carpetas de logs ***[Carpeta /logs ***" && cp -R /var/log /home/guarina0x0/forense/logs
echo "● Determinar la fecha en el sistema *** Fichero [fechasistema.txt] *** " && date +'%d/%m/%Y %H:%M' >> fechasistema.txt
echo "● Determinar el nombre de host del sistema , mirar en Equipo.txt *** [Fichero Equipo.txt] ***" && cat /etc/*-release >> equipo.txt
echo "● Información sobre la CPU del sistema *** [Fichero Cpu.txt] ***" && cat /proc/cpuinfo >> cpu.txt
echo "● Determinar los usuarios registrados en el Sistema **** [Fichero Usuariosregistrados.txt] ***" && cut -d: -f1 /etc/passwd >> usuariosregistrados.txt
echo "● Determinar los procesos en ejecución en el sistema *** [FIchero Procesosexec.txt] ***" && ps aux >> procesosexec.txt
echo "● Determinar el árbol de procesos (y argumentos) *** [Fichero arbolprocesos] ***" && pstree -gnca >> arbolprocesos.txt
echo "● Determinar los discos / elementos montados *** [Fichero mountdiscos.txt] ***" && fdisk -l >> mountdiscos.txt
echo "● Revisar la salida de la utilidad de particionado disco (Particiones) *** [Fichero salidaparticiones.txt] ***" &&  mount >> salidaparticiones.txt
echo "● Determinar las extensiones de uso de discos *** [Fichero estadisticadisco.txt] ***" &&  df -hm >> estadisticadisco.txt
echo "● Determinar las extensiones de kernel cargadas *** [Fichero moduloskernel.txt] ***" && lsmod >> moduloskernel.txt
echo "● Obtener los parametros de arranque del kernel *** [Fichero parametroskernel.txt] ***" && cat /etc/default/grub >> parametroskernel.txt
echo "● Determinar el tiempo de actividad del sistema *** [Fichero actividadsistema.txt] ***" &&  uptime >> actividadsistema.txt
echo "● Determinar el entorno del sistema (Version de SO ,  kernel que se esta usando y si es de 32 o 64 bits *** [Fichero entornosistema.txt] ***" && uname -a >> entornosistema.txt
echo "● Determinar las variables de entorno del sistema *** [Fichero variablesentorno.txt] ***"  && printenv >> variablesentorno.txt
echo "● Determinar el uso de la memoria del proceso en ejecucion *** [Fichero memoriaejecucion] ***" && top -n1 -b >> memoriaejecucion.txt 
echo "● Determinar los servicios en ejecucion *** [Fichero serviciosopen.txt] ***" && service --status-all | grep + >> serviciosopen.txt
echo "● Determinar todos los modulos cargardos *** [Fichero moduloscargados.txt] ***" && lsmod >> moduloscargados.txt 
echo "● Determinar los ultimos inicio de sesion *** [Fichero ultimasession.txt] ***" && last >> ultimosession.txt
echo "● Revisar el contenido de usuarios *** [Fichero passwd.txt] ***"  && cat /etc/passwd >> passwd.txt
echo "● Revisar el contenido de grupos *** [Fichero group.txt] ***" && cat /etc/group >> group.txt
echo "● Determinar el ultimo inicio de sesion por usuario *** [Fichero lasstsession.txt] ***" && last --since -1days >> lastsession.txt
echo "● Determinar quien es el usuario que inicio sesion por usuario *** [Fichero quienusuario.txt] ***" && last --fullnames >> quienusuario.txt
echo "● Determinar con que usuario se inicio sesion *** [Fichero quiensesionlast.txt] ***" && logname >> quiensesionlast.txt
echo "● Determinar grupos a los que pertenece el usuario *** [Fichero quegrupo.txt] ***" && id >> quegrupo.txt 
echo "● Revisar .bash_history para cada usuario *** [Fichero historial.txt] ***" && history >> historial.txt  
echo "● Determinar las conexiones de red actuales *** [Fichero conexionesnow.txt] ***" && ip a >> conexionesnow.txt
echo "● Compruebe adaptadores/interfaces de red *** [Fichero Interfazred.txt] ***" && ifconfig >> interfazred.txt
echo "● Determinar estadisticas de sockets ***[Fichero sockets.txt] ***" && netstat -xl >> sockets.txt
echo "● Determinar la lista de puertos abiertos ***[Fichero puertosabiertos.txt] ***" &&  netstat -plnut >> puertosabiertos.txt
echo "● Determinar la tabla de enrutamiento *** [Fichero tablaenrutamiento.txt] ***" && route >> tablaenrutamiento.txt
echo "● Determinar la tabla ARP *** [Fichero arp.txt] ***" &&  ip neigh show >> arp.txt
echo "● Determinar la informacion de la interfaz de red *** [Fichero interfazinfo.txt] ***" && ifconfig -a >> interfazinfo.txt
echo "● Revisar los host permitidos *** [Fichero hostsok.txt] ***" && cat /etc/hosts.allow >> hostsok.txt
echo "● Revisar los host denegados *** [Fichero hostsdeny.txt] ***" &&  cat /etc/hosts.deny >> hostsdeny.txt
echo "● Obtener la resolucion DNS estatica ***[Fichero dnsstatic.txt] ***"  && cat /etc/resolv.conf >> dnsstatic.txt
echo "● Obtener informacion de gateway y DNS dinamicos que usen *** [Fichero gatedns.txt] ***" &&  cat /etc/resolv.conf >>  gatedns.txt
echo "● Buscar ficheros que tengan activo los permisos SUID O GUID *** [Fichero SUIDGUID.txt] ***" &&  find . -perm /4000 && find . -perm /2000 >> SUIDGUID.txt

echo "****  GUARDANDO EN FORENSE/   ****"
cp *.txt forense/
echo "**** Comprimiendo Carpeta /FORENSE/   ****"
tar -zcvf artefactos-forense.tar.gz forense/ 2>/dev/null
echo "**** Limpiando ****"
rm -R *.txt

