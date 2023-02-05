import airflow
from datetime import timedelta
from airflow import DAG
import os
from datetime import date, datetime

from airflow.contrib.hooks.ssh_hook import SSHHook
from airflow.providers.ssh.operators.ssh import SSHOperator
#from airflow.providers.ssh.operators.ssh import PythonOperator 

sshHook = SSHHook(ssh_conn_id='ssh_to_spark')
print(sshHook)

default_args = {
'owner': 'airflow',
'start_date':datetime(2022, 9, 30),
}

dag_spark = DAG(
dag_id = "datalake_etl",
default_args=default_args,
schedule_interval=None,
)

t1 = SSHOperator(
     task_id="task1",
     command=f'spark-submit stg_load_spark.py 2022-09-30',
     ssh_hook=sshHook,
     dag=dag_spark)

t1