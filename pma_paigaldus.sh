#phpmyadmin paigaldusskript
#
#kontrollime, mitu korda phpmyadmin korrla ok intalled
#sõnad on leitud ja vastus salvestame
#muutuja sisse:
PMA=$(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c 'ok instlled')
#kui PMA muutuja väärtus võrdub 0-ga
if [ $PMA -eq 0 ]; then
	#siis ok installed ei ole leitud
	#ja väljastame vastav teade ning
	#paigaldame teenus
	echo "Paigaldame phpmyadmin ja vajalikud lisad"
	apt install phpmyadmin
	echo "phpmyadmin on paigaldatud"
#kui PMA muutuja väärtus võrdub 1-ga
elif [ $PMA -eq 1 ]; then
	#siis ok installed on leitud 1 kord
	#ja teenus on juba paigaldatud
	echo "phpmyadmin on juba paigaldatud"
	apt list --installed 2>/dev/null | grep phpmyadmin
	#kontrollime olemasolu
#lõpetame tingimuslause
fi
#skripti lõpp
