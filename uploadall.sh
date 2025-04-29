hdfs dfs -mkdir -p /user/you/input
hdfs dfs -put ./input/accounts.csv /user/you/input/
hdfs dfs -put ./input/data_dictionary.csv /user/you/input/
hdfs dfs -put ./input/products.csv /user/you/input/
hdfs dfs -put ./input/sales_pipeline.csv /user/you/input/
hdfs dfs -put ./input/sales_teams.csv /user/you/input/

# execute .jar
hadoop jar ./src/wordcount.jar com.example.WordCount /user/you/input/sales_pipeline.csv /user/you/total_vendas

# cat on hadoop
hdfs dfs -cat /user/you/total_vendas/part-*
