#!/usr/bin/python

import cson
import sys

def lower_case_test(data):
  if not isinstance(data, dict):
    return
  for (key, value) in data.items():
    if key != key.lower():
      print("ERROR: Keys must be in lower case")
      print(filename + " -> " + str(key))
      exit(1)
    lower_case_test(value)

if __name__ == '__main__':
  for filename in sys.argv[1:]:
    try:
      data = cson.load(filename)
    except:
      print("ERROR: " + filename + " not in CSON format")
      exit(2)
    lower_case_test(data)
