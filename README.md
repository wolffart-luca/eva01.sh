# eva01.sh
Script en bash para automatizar un escaneo de nmap y realizar fuzzing si se encuentra el puerto 80 abierto.

El fuzzing se hara con dos diccionarios distintos

Para utilizar este script desde cualquier carpeta sin necesidad de especificar la ruta, siga estos pasos:

>sudo mv eva01.sh /usr/local/bin
>chmod +x /usr/local/bin/eva01.sh

**Tenga en cuenta que los escaneos están planificados para entornos controlados.
Si desea realizarlo en entornos reales, deberá modificar la agresividad del escaneo.**
