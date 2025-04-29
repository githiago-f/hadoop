package com.example;

import java.io.IOException;
import java.security.InvalidParameterException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

/**
 * Mapper class: reads lines of text and emits (agent, amount) for each token.
 */
public class TokenizerMapper
    extends Mapper<Object, Text, Text, IntWritable> {

  // constant serializable integer
  private Text word = new Text();
  private IntWritable value = new IntWritable(0);

  @Override
  public void map(Object key, Text line, Context context) throws IOException, InterruptedException {
    String[] values = line.toString().split(",");

    if (values.length < 7)
      return;
    try {
      String dealStage = values[4], agent = values[1], closeValue = values[7];

      // skip deals with no value.
      if (dealStage != "Engaging" && dealStage != "deal_stage") {
        word.set(agent);
        value.set(Integer.valueOf(closeValue));
        context.write(word, value);
      }
    } catch (NumberFormatException e) {
      System.err.println(e);
    }
  }
}
