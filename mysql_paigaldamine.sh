# mysql-server paigaldusskript
#
# kontrollime, mitu korda mysql-server korral ok installed
# sõnad on leitud ja vastus salvestame
# muutuja sisse:
MYSQL=$(dpkg-guery -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed')
# kuyi MYSQL muutuja väärtus võrdub 0-ga
if [ $MYSQL -eq 0 ]; then
	# siis ok installed ei ole leitud
	# ja väljastame vastav teade ning
	# paigaldame teenus
	echo "Paigaldame mysql ja vajalikud lisad"
	wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
	apt install ./mysql-apt-config_0.8.22-1_all.deb
	apt install mysql-server
	echo "mysql on paigaldatud"
	# lisame võimalus kasutada mysql käsk ilma kasutaja ja parooli lisamiseta
	touch $Home/ .my.cnf #lisame vajalik konfiguratsiooni fail antud kasutaja kodukausta
	echo "[client]" >> $HOME/.my.cnf
	echo "host = localhost" >> $Home/.my.cnf
	echo "user = root" >> $HOME/.my.cnf
	echo "password = qwerty" >> $HOME/.my.cnf
#kui MYSQL muutuja väärtus võrdub 1-ga
elif [ $MYSQL -eq 1 ]; then
	# siis ok installed on leitud 1 kord
	# ja teenus on juba paigaldatud
	echo "mysql-server on juba paigaldatud"
	# kontrollime olemasolu	
	mysql
# lõpetame tingimuslause
fi
# skripti lopp
