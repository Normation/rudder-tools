#!/usr/bin/python

import cson
import sys
from pprint import pprint

def coherent(data):
  # systems must exist
  for s in data['architectures'].keys():
    s = s.split("-")[0]
    if s not in systems:
      print("ERROR: Undefined system " + s + " in '" + filename + "' It should be declared in systems.cson")
      exit(1)

  # architectures and roles must have the same systems
  set1 = set(data['architectures'].keys())
  set2 = set(data['roles'].keys())
  if set1 != set2:
    diff = set1.symmetric_difference(set2)
    for s in diff:
      print("ERROR:" + s + " is not in architectures and roles in '" + filename + "'")
    exit(2)

  # roles and package must have the same roles
  roles = []
  for role in data['roles'].values():
    roles.extend(role)
  set1 = set(roles)
  set2 = set(data['packages'].keys())
  if set1 != set2:
    diff = set1.symmetric_difference(set2)
    for s in diff:
      print("ERROR:" + s + " is roles and packages in '" + filename + "'")
    exit(2)


if __name__ == '__main__':
  systems = cson.load(sys.argv[1])
  for filename in sys.argv[2:]:
    try:
      data = cson.load(filename)
    except:
      print("ERROR: " + filename + " not in CSON format")
      exit(2)
    coherent(data)
