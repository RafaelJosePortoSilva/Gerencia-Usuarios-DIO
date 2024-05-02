#!/bin/bash

for diretorio in /publico /adm /ven /sec; do 
    echo "Criando diretório $diretorio"
    mkdir $diretorio
    chown -Rc root $diretorio
    chmod 770 $diretorio
done

chmod 777 /publico

for grupo in GRP_ADM GRP_VEN GRP_SEC; do
    echo "Criando grupo $grupo"
    groupadd $grupo
done

chgrp GRP_ADM /adm
chgrp GRP_VEN /ven
chgrp GRP_SEC /sec

for usuario in carlos maria joao debora sebastiana roberto josefina amanda rogerio; do
    echo "" Criando usuario $usuario
    useadd $usuario -m -s /bin/bash -p $(openssl passwd -crypt 1234)
done

for user in carlos maria joao; do
    usermod -G GRP_ADM $user
done

for user in debora sebastiana roberto; do
    usermod -G GRP_VEN $user
done

for user in josefina amanda rogerio; do
    usermod -G GRP_SEC $user
done




