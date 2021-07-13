#!/bin/bash

# V 1.0

# Script para copiar bd do grafana para o cronos
destino="192.168.100.10:/media/bkp_dbs/GRAFANA"
user=""

DATA=`date +"%H%m%S_%m%d%Y"`
DATA_LOG=`date +'%Y-%m-%d %H:%M:%S'`
scp /var/lib/grafana/grafana.db $user@$destino/grafana.db.${DATA} 2>/dev/null
ERRO=$?

if [ ${ERRO} -eq 0 ]
then 
	echo "0 ${DATA_LOG} Backup do BD do Grafana executado com sucesso" > /dbs/scripts/zabbix/logs/bkp-diario-grafana.txt
	else 
		echo "1 ${DATA_LOG} Backup do BD do Grafana executado com FALHA" > /dbs/scripts/zabbix/logs/bkp-diario-grafana.txt
fi

