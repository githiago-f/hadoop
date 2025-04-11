#!/bin/bash

HADOOP_INSTALL_BASE_PATH="/workspaces/hadoop-ins"

if (!(test -d $HADOOP_INSTALL_BASE_PATH)); then
    mkdir $HADOOP_INSTALL_BASE_PATH
    curl https://dlcdn.apache.org/hadoop/common/stable/hadoop-3.4.1.tar.gz -L -o $HADOOP_INSTALL_BASE_PATH/hadoop.tar.gz
    tar -xzvf $HADOOP_INSTALL_BASE_PATH/hadoop.tar.gz -C $HADOOP_INSTALL_BASE_PATH
    rm -f $HADOOP_INSTALL_BASE_PATH/hadoop.tar.gz
fi

export PATH="$PATH:$HADOOP_INSTALL_BASE_PATH/hadoop-3.4.1/bin"
export HADOOP_DIR="$HADOOP_INSTALL_BASE_PATH/hadoop-3.4.1"

if (!(test -d 'input')); then
    mkdir input
    cp $HADOOP_DIR/etc/hadoop/*.xml input
fi

if (test -d 'output'); then
    rm -rf output
    mkdir output
fi

hadoop jar $HADOOP_DIR/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.4.1.jar grep input output 'dfs[a-z.]+'

cat output/*
