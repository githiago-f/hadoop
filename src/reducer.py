# reducer.py
import sys
word_counts = {}
for line in sys.stdin:
    word, count = line.strip().split("\t")
    count = int(count)
    word_counts[word] = word_counts.get(word, 0) + count
for word, count in word_counts.items():
    print(f"{word}\t{count}")