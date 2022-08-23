#!/bin/bash

echo "etapa 1/3: criando diretórios..."

echo "criando diretório publico"
mkdir /publico

echo "diretorio criado. criando diretório admin"
mkdir /adm

echo "diretorio admin criado! criando o diretorio vend"
mkdir /ven

echo "diretorio vend criado! criando o último diretório sec"
mkdir /sec

echo "finlizado! todos os diretórios foram criados"

echo "etapa 2/3: criando grupos de usuários"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo "todos os grupos foram criados com sucesso! GRP_ADM, GRP_VEN e GRP_SEC"

echo "etapa 3/3: criando usuários e gerenciando permissões..."
useradd carlos -c "Carlos" -m -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_ADM
useradd maria -c "Maria" -m -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_ADM
useradd joao -c "João" -m -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_ADM
echo "usuários do grupo GRP_ADM criados com sucesso! ..."

echo "iniciando a criação dos usuários do grupo GRP_VEN!"
useradd debora -c "Debora" -m -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_VEN
useradd sebastiana -c "Sebastiana" -m -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_VEN
useradd roberto -c "Roberto" -m -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_VEN

echo "usuários do grupo GRP_VEN criados com sucesso! iniciando a criação dos usuários do último grupo GRP_SEC"
useradd josefina -c "Josefina" -m -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_SEC
useradd amanda -c "Amanda" -m -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_SEC
useradd rogerio -c "Rogerio" -m -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_SEC

echo "aplicando permissões..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
chmod 777 /publico
chmod 700 /adm
chmod 700 /sec
chmod 700 /ven

echo "finalizado com sucesso!"
