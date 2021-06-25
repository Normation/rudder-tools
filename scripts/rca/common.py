import rule
import directive
import sys
sys.path.insert(0, "/usr/share/rudder-api-client/")
sys.path.insert(0, "/opt/rudder/share/python")
from rudder import RudderEndPoint, RudderError

with open('/var/rudder/run/api-token') as ftoken:
    TOKEN = ftoken.read()
RUDDER_URL="https://localhost/rudder"
endpoint = RudderEndPoint(RUDDER_URL, TOKEN, verify=False)

## Get all variable definition
rawDirectives = endpoint.list_techniques_directives("genericVariableDefinition")["directives"]
directives = [ directive.Directive(x) for x in rawDirectives ]

## Get all rules
rawRules = endpoint.list_rules()["rules"]
rules = [ rule.Rule(x) for x in rawRules ]

## Get all groups
rawGroups = endpoint.list_groups()["groups"]
groups = [ x["id"] for x in rawGroups ]


#### Functions
"""
  Return all directives defined
"""
def get_directives():
  return directives

"""
  Return all rules defined
"""
def get_rules():
  return rules

"""
  Return all groups defined
"""
def get_groups():
  return groups

"""
  Return a list with the ids of all directives applied to the target group
"""
def get_directives_applied_to(group):
  appliedDirectives = set()
  for iRule in rules:
    if group in iRule.getIncludeTargets():
      for iDirective in iRule.directives:
        appliedDirectives |= set([ x for x in directives if x.id == iDirective ])
  return list(appliedDirectives)

"""
  Sort the table to display on the given column.
  toSort must respect the same input than the display functions (dictToAsciiTable)
"""
def sortToDisplay(toSort, criterion):
  sortedList = []
  columnNames = [x['title'] for x in toSort]
  if criterion not in columnNames:
    print("Unknown column name '%s' to sort by, available columns are: %s"%(criterion, columnNames))
    exit(1)
  refColumn = next(x for x in toSort if x['title'] == criterion)['value']
  for iColumn in toSort:
    zipped = zip(refColumn, iColumn['value'])
    sorted_zip = list(sorted(zipped, key=lambda t:t[0]))
    sortedvalue = [j for (i, j) in sorted_zip]
    sortedList.append({
      'title' : iColumn['title'],
      'value' : sortedvalue
    })
  return sortedList

"""
   Print dict list in a fancy manner
   Assume the list is following the format:
   [
     { "title": "strkey1", "value" : [ "str", "str2", ... ] },
     { "tilte": "strkey2", "value" : [ "str", "str2", ... ] },
     ...
   ]
"""
def dictToAsciiTable(data):
    # Get maximum text length to print
    lengths = [ len(max([str(i) for i in [column["title"]] + column["value"]], key=len)) for column in data ]
    lengths = [50, 50, 50]
    lines = []
    sep = "|"
    nbElem = len(data[0]['value'])
    for i in range(0, nbElem):
        line = []
        for c in data:
            line.append(c['value'][i])
        lines.append(line)

    headers = []
    for c in data:
        headers.append(c['title'])

    # Print headers
    toPrint = generateSepLine(lengths)
    toPrint += generateLine(headers, lengths, sep)
    for i in lines:
        toPrint += generateSepLine(lengths)
        toPrint += generateLine(i, lengths, sep)
    toPrint += generateSepLine(lengths)
    return toPrint

def generateSepLine(lengths):
    sepBar = ""
    for iSep in lengths:
        fieldLength = int(iSep) -1
        sepBar += "+" + "-" * fieldLength
    return sepBar + "+\n"

"""
Parse the line array to split each element in multiline
sublines:
[
 ["line 1 of A", "line 2 of A" ],
 ["line 1 of B", "line 2 of B" ],
 ["line 1 of C"
]
Transform it to something like:
printables:
[
 ["line 1 of A", "line 1 of B", "line 1 of C", ... ],
 ["line 2 of A", "           ", "line 2 of C", ... ],
 [ ... ]
]
"""
def generateLine(line, lengths, sep):
    sublines = []
    for i in range(len(line)):
        string = str(line[i])
        width = lengths[i] -1
        sublines.append([string[x:x+width] for x in range(0, len(string), width)])

    printables = []
    for i in range(max([ len(x) for x in sublines])):
        printables.append([])
        for j in range(len(sublines)):
            width = lengths[j] -1
            if i < len(sublines[j]):
                subfield = '{0: <{1}}'.format(sublines[j][i], width)
            else:
                subfield = ' ' * width
            printables[i].append(subfield.replace('\n', ' '))
    printedLine = ""
    for i in printables:
        printedLine += "|"
        printedLine += "|".join(i) + "|\n"
    return printedLine
