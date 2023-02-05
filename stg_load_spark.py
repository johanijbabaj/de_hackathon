import os
import findspark
findspark.init()
findspark.find()

import pyspark
from pyspark.sql import SparkSession
import sys

def main():
    spark = SparkSession.builder.master("local").appName("S3toPostgreSQL").getOrCreate()

    # Load data from S3 into a Spark DataFrame
    date = sys.argv[1]
    path_from = f'file:///home/ubuntu/s3_data/{date}'

    df = spark.read.json(path_from)

    from pyspark.sql import functions as f

    df_json = df.withColumn('value',f.to_json
    (
        f.struct(
            f.col('browser_language'),
            f.col('browser_name'),
            f.col('browser_user_agent'),
            f.col('click_id'),
            f.col('device_is_mobile'),
            f.col('device_type'),
            f.col('event_id'),
            f.col('event_timestamp'),
            f.col('event_type'),
            f.col('geo_country'),
            f.col('geo_latitude'),
            f.col('geo_longitude'),
            f.col('geo_region_name'),
            f.col('geo_timezone'),
            f.col('ip_address'),
            f.col('os'),
            f.col('os_name'),
            f.col('os_timezone'),
            f.col('page_url'),
            f.col('page_url_path'),
            f.col('referer_medium'),
            f.col('referer_url'),
            f.col('referer_url_port'),
            f.col('referer_url_scheme'),
            f.col('user_custom_id'),
            f.col('user_domain_id'),
            f.col('utm_campaign'),
            f.col('utm_content'),
            f.col('utm_medium'),
            f.col('utm_source'),
        )
    )).select(f.current_timestamp().alias('timestamp'), 'value')

    # Write the DataFrame to PostgreSQL
    df_json.write.format("jdbc").option("url", "jdbc:postgresql://51.250.69.170:5432/postgres") \
        .option('driver', 'org.postgresql.Driver') \
        .option("dbtable", "stg.events") \
        .option("user", "jovyan") \
        .option("password", "jovyan") \
        .mode("append") \
        .save()

if __name__ == "__main__":
        main()