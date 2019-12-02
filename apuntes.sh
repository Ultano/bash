

# ¿Cuánto está ocupando en disco cada usuario?
# mostrar la ruta del directorio home y su espacio utilizado para aquellos usuarios cuyo username empiece por a y que estén entre los 10 últimos usuarios
tail etc/passwd | grep ^a | cut -d: -f6 | xargs du -sh
tail etc/passwd | grep ^a | cut -d: -f1,6 | xargs du -sh # muestra el nombre y su directorio home

du /ruta/al/directorio # muestra el espacio utilizado por un directorio en bits
du -s /ruta/al/directorio # muestra el espacio utilizado por un directorio en bits y su ruta
du -h /ruta/al/directorio # muestra el espacio utilizado por un directorio y sus sub directorios
du -sh /ruta/al/directorio # muestra el espacio utilizado por un directorio y su ruta


# ¿en qué puertos está escuchando Apache?
# mostrar las líneas que contienen "Listen" sin importar mayúsculas y minúsculas, salvo las que
# contengan '#' en todos los ficheros del directorio /etc/apache2 y sub directorios de éste
# sin repetir
grep Listen -iR /etc/apache2/* | grep -v '#' | uniq

# ¿Cuándo se ha logado el usuario root?
grep login.*root /var/auth.log

# ¿Cuántas líneas tienen estos ficheros .php?
wc -l *.php
wc -w *.php # ¿Y cuántas palabras?
wc -l *.php # ¿Y cuántos caracteres?

# ordenamos por número de líneas:
wc -l *.php | sort -n # realmente -n no debería ser necesario, pero puede hacer falta
wc -l *.php | sort -nr # en orden inverso

# mostrar número total de líneas en los ficheros .php
cat *.php | wc -l

# sustituir en el fichero mi_fichero.php la variable $version por $vrs
sed -e 's/\$version/\$vrs/g' mi_fichero.php

# obtener información de la configuración de red:
cat /etc/network/interfaces

# Variables de sistema
$USER
$PATH

# en echo la bandera -e sirve para que se interpreten los caracteres especiales

echo -e "escribe un salto de linea \n y luego \t un tabulado \n y en una nueva línea cuánto vale 4 x 5 = $((4*5))"


cat -n fichero.php
# muestra el número de línea además de mostrar el fichero en cuestión

more
less # como more, pero con más opciones y optimizado para grandes ficheros (no lo lee entero, sino poco a poco)

head
tail

head -15 *.php # muestra las 15 primeras líneas de todos los ficheros PHP
head -15 -q *.php # evita mostrar los nombres de los ficheros en la salida

cut /etc/passwd -c 4,5,7 # muestra los caracteres 4, 5 y 7 de cada línea
cut /etc/passwd -c 4-7 # muestra los caracteres 4 al 7 de cada línea
cut /etc/passwd -c 1-4,7 # muestra los caracteres 4 al 7 y el 10 de cada línea

cut /etc/passwd


grep
  -v # muestra lo que no coincide con el patrón
  -l # indica sólo el fichero en el que encuentra la coincidencia
  -w # el patrón buscado debe ser una palabra independiente
  -n # muestra el número de línea
  -i # case insensitive
  -c # muestra simplemente el número de veces que se encuentra
  -r # recursividad en subdirectorios

sort # ordena filas de un fichero, por defecto por orden alfabético
  -r # orden inverso
  -n # ordena basándose en una información numérica
  -h # ordena basándose en magnitudes humanas (bites, kilobites, Mb, GB...)

uniq # ignora filas duplicadas que estén seguidas
  -d # muestra sólo las líneas repetidas seguidas
  -i # case insensitive
  -c # cuenta el número de veces que una línea está repetida

wc # cuenta líneas, palabras y caracteres
  -l # devuelve las líneas
  -w # devuelve las palabras
  -c # devuelve los caracteres
rev # invierte el orden de los caracteres línea a línea
  # muy útil si quieres obtener el nombre de cada fichero final de forma
  # recursiva en una búsqueda:

openssl rand -base64 960 # genera un texto aleatorio

comando > fichero.txt # sobre escribe el fichero con la salida estándar
comando >> fichero.txt # escribe al final del fichero la salida estándar
comando 2> fichero.txt # sobre escribe el fichero con la salida de error
comando 2>> fichero.txt # escribe al final del fichero la salida de error
comando &> fichero.txt # sobre escribe el fichero con la salida estándar y de error
comando &>> fichero.txt # escribe al final del fichero la salida estándar y de error

du -sh /* 2> /dev/null | sort -h | tail -n1 # muestra el directorio más pesado de la raíz

sort < listado.txt # ordena las líneas del fichero listado.txt

mysql < db_backup.sql # ejecuta en mysql cada sentencia del fichero db_backup.sql

cat /etc/passwd | cut -d":" -f6| sort | uniq -c # muestra el número de usuarios que utilizan
                                                # intérprete de comandos

tr [A-Z] [a-z] < prueba.txt # pone las letras en minúsculas
[a*3] # indica la cadena aaa

# caracteres especiales:
\\ # barra invertida
\a # Carácter audible (Campana/bell)
\b # Retroceso
\f # salto de página
\n # salto de línea
\r # retorno de carro
\t # tabulador
\v # tabulador vertical


clases
[:alnum:] # letras y dígitos
[:alpha:] # letras
[:blank:] # espacios en blanco
[:cntrl:] # caracteres de control
[:space:] # espacios en blanco verticales y horizontales
[:graph:] # caracteres imprimibles excluido el espacio en blanco
[:print:] # caracteres imprimibles incluido el espacio en blanco
[:digit:] # dígitos
[:lower:] # letras minúsculas
[:upper:] # letras mayúsculas
[:punct:] # signos de puntuación
[:xdigit:] # dígitos hexadecimales

tr -d [:punct:] # con la opción -d elimina los caracteres seleccionados
tr -s # elimina los caracteres que cumplen el patrón y están repetidos consecutivamente
tr -c # afecta a todos los caracteres menos a los que cumplen el patrón

sed # editor de flujo de texto (streaming editor)

-n # suprime la salida estándar, para no ver las líneas duplicadas
-e 'script' # indica que se ejecute el script que viene a continuación. Si no se utiliza -f se puede omitir
-f archivo # indica que las órdenes se ejecutan desde un archivo
-r # compatible con expresiones regulares extendidas
-i # se sobreescribe el fichero

sed 2,5p texto.txt # del fichero texto.txt aplicamos, entre la línea 2 y la 5, la acción p, que es imprimir
sed 2,\$p texto.txt # del fichero texto.txt aplicamos, entre la línea 2 y la última, la acción p, que es imprimir
sed '2,$p' texto.txt # del fichero texto.txt aplicamos, entre la línea 2 y la última, la acción p, que es imprimir
sed 2p texto.txt # del fichero texto.txt aplicamos, entre la línea 2 y la última, la acción p, que es imprimir
sed /^a/p texto.txt # del fichero texto.txt aplicamos, a las líneas que empiecen por a, la acción p, que es imprimir
sed /^a.*o$/p texto.txt # del fichero texto.txt aplicamos, a las líneas que empiecen por a y terminen por o, la acción p, que es imprimir
sed /pepe/,\$p texto.txt # del fichero texto.txt aplicamos, a las líneas desde que aparece la palabra "pepe" hasta la última, la acción p, que es imprimir


comandos sed:
i # insertar líneas delante de la línea afectada
a # insertar líneas después de la línea afectada
c # sustituir la línea afectada
d # borrar la línea afectada
p # imprimir la línea afectada en la salida estándar
s # sustituir cadenas
! # invertir la ubicación seleccionada (afecta a todo lo que no cumple la condición)
q # abandona el proceso al llegar a la línea afectada


sed -e '5a\FRASE1' -e '7a\FRASE2' fichero.txt # inserta frases delante de las líneas seleccionadas 5 y 7
sed -e '5q' -e '7a\FRASE2' fichero.txt # inserta frases delante de las líneas seleccionadas 5 y 7

sed -e 's/[[:upper:]]/X/' misdatos.txt # sustituye la primera mayúscula del fichero por una X
sed -e 's/[[:upper:]]/X/g' misdatos.txt # sustituye todas las mayúsculas del fichero por una X

sed -f instrucciones_sed.txt fichero.txt # aplicará los scripts, línea a línea, de fichero instrucciones_sed.txt al las líneas del fichero fichero.txt

sed -n -e '1,$s/[[:upper:]]/ /g' data.csv # elimina todas las myúsculas
cat data.csv | tr -s [:alnum:] # elimina todos los caracteres alfanuméricos repetidos

sed -n -e '6,$p' data.csv # muestra todo excepto las 5 primeras líneas
sed -n -e '20,30p' data.csv # muestra las líneas 20 a 30
sed 's/[[:graph:]]/ /' data.csv # elimina el primer caracter de cada línea
sed -n -e '1i/DATOS/' -e '$a/FIN DATOS/' data.csv
sed -e '1iDATOS' -e '$aFIN DATOS' data.csv # inserta la palabra DATOS antes de la primera línea y la frase FIN DATOS después de la última línea
cat data.csv | tr ";" "\t" # sustituye cada ; por un tabulado

#### expresiones regulares
sudo apt install wspanish # instala el diccionario en español
grep '^[Cf].c.[^eio]s$' /usr/share/dict/spanish # empieza por C o por f, otro caracter, una c, otro caracter, cualquier caracter excepto la e, la i o la o, una s y final de línea
grep -E '(c[aeiou]){3,4}' /usr/share/dict/spanish # busca palabras que contengan de 3 a 4 veces una c seguida de una vocal
grep
  -E # expresiones regulares extendidas
  --color # resaltado en color de los resultados detectados

  \< # indica el inicio de la palabra
  \> # indica el final de la palabra
  \b # indica el inicio o fin de la palabra
  \B # lo contrario a \b

sed
  -r # expresiones regulares extendidas

grep -E '^(.+).?\1' /usr/share/dict/spanish
grep -E '^(.)(.)(.).?\3\2\1$' /usr/share/dict/spanish # muestra las palabras capicúa de 6 ó 7 letras






.
