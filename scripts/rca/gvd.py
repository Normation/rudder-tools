from directive import GenericVariableDefinitionDirective
from rule import Rule
import common

class Gvd():
  def __init__(self, name, value, gvdDirective):
    self.name = name
    self.value = value
    self.directive = gvdDirective

### GET functions ###
"""
  Return a list of all GenericVariableDefinitionDirective
"""
def get_all():
  results = []
  for iDirective in common.get_directives():
    if iDirective.techniqueName == "genericVariableDefinition":
      gvdDirective = GenericVariableDefinitionDirective(iDirective)
      for iVar in gvdDirective.getVariables():
        gvd = Gvd(iVar['name'], iVar['value'], gvdDirective)
        results.append(gvd)
  return results

"""
  Return the gvdDirective with given uid
"""
def get_gvd(uid):
  for iDirective in common.get_directives():
    if iDirective.id == uid:
      gvdDirective = GenericVariableDefinitionDirective(iDirective)
      results = []
      for iVar in gvdDirective.getVariables():
        results.append(Gvd(iVar['name'], iVar['value'], gvdDirective))
      return results
  return None

"""
  Return a list of all GenericVariableDefinitionDirective applied to the target group
"""
def get_defined_in_group(group_id):
  applied_to = common.get_directives_applied_to(group_id)
  results = []
  for iDirective in applied_to:
    if iDirective.techniqueName == "genericVariableDefinition":
      gvdDirective = GenericVariableDefinitionDirective(iDirective)
      for iVar in gvdDirective.getVariables():
        results.append(Gvd(iVar['name'], iVar['value'], gvdDirective))
  return results

"""
  Return a list of all GenericVariableDefinitionDirective applied in the target rule
"""
def get_defined_in_rule(rule):
  if not isinstance(rule, Rule):
    rule = next(x for x in common.get_rules() if x.id == rule)
  results = []
  directives = common.get_directives()
  for iDirId in rule.directives:
    matchingDirectives = [ x for x in directives if x.id == iDirId and x.techniqueName == "genericVariableDefinition" ]
    for iDirective in matchingDirectives:
      gvdDirective = GenericVariableDefinitionDirective(iDirective)
      for iVar in gvdDirective.getVariables():
        results.append(Gvd(iVar['name'], iVar['value'], gvdDirective))
  return results

"""
  Return a list of all GenericVariableDefinitionDirective defining the target variable
"""
def get_all_directives_defining(varName):
  results = []
  for iDirective in common.get_directives():
    if iDirective.techniqueName == "genericVariableDefinition":
      gvdDirective = GenericVariableDefinitionDirective(iDirective)
      if gvdDirective.defines(varName):
        results.append(gvdDirective)
  return results

### DISPLAY functions ###

"""
  Display a list of GenericvariableDefinitionDirective
"""
def display_gvd_list(results, criterion="Name"):
  names = []
  values = []
  displayNames = []
  sortedResults = sorted(results, key=lambda gvd: gvd.name)
  for iGvd in sortedResults:
    names.append(iGvd.name)
    values.append(iGvd.value)
    displayNames.append(iGvd.directive.directive.displayName)
  toDisplay = [
     { "title": "Name", "value": names },
     { "title": "Value", "value": values },
     { "title": "Directive", "value": displayNames }
  ]
  sortedToDisplay = common.sortToDisplay(toDisplay, criterion)
  print(common.dictToAsciiTable(sortedToDisplay))

"""
  Display all GenericVariableDefinitionDirective
"""
def display_all(criterion):
  results = get_all()
  display_gvd_list(results, criterion)

"""
  Display all GenericVariableDefinitionDirective applied to the target group
"""
def display_defined_in_rule(rule, criterion):
  results = get_defined_in_rule(rule)
  display_gvd_list(results, criterion)

"""
  Display all GenericVariableDefinitionDirective applied to the target group
"""
def display_defined_in_group(group_id, criterion):
  results = get_defined_in_group(group_id)
  display_gvd_list(results, criterion)

"""
  Display all GenericVariableDefinitionDirective defining the target variable
"""
def display_all_definitions_of(varName, criterion):
  results = get_all_directives_defining(varName)
  names = []
  values = []
  displayNames = []
  for iDirective in results:
    for iVar in iDirective.getVariables():
      if iVar["name"] == varName:
        names.append(iVar['name'])
        values.append(iVar['value'])
        displayNames.append(iDirective.directive.displayName)
  toDisplay = [
     { "title": "Name", "value": names },
     { "title": "Value", "value": values },
     { "title": "Directive", "value": displayNames }
  ]
  print(common.dictToAsciiTable(common.sortToDisplay(toDisplay, criterion)))

"""
  Display a list of all Rules defining a variable multiple times
"""
def display_all_duplicates_in_rules(criterion):
  for iRule in common.get_rules():
    allVars = []
    gvdDirectives = get_defined_in_rule(iRule)
    # list all variables and store them with their directive
    for iGvd in gvdDirectives:
        allVars.append(iGvd.name)

    # find all duplicates
    results = []
    for iGvd in gvdDirectives:
      occ = sum(1 for x in allVars if x == iGvd.name)
      if occ > 1:
        results.append(iGvd)
    if [] != results:
      print(iRule.displayName)
      display_gvd_list(results, criterion)

"""
  Display a list of all conflicting gvdD applied by group
"""
def display_all_duplicates_in_groups(criterion):
  for iGroup in common.get_groups():
    gvdInGroup = get_defined_in_group(iGroup)
    allVars = []
    # list all variables and store them with their directive
    for iGvd in gvdInGroup:
        allVars.append(iGvd.name)

    # find all duplicates
    results = []
    for iGvd in gvdInGroup:
      occ = sum(1 for x in allVars if x == iGvd.name)
      if occ > 1:
        results.append(iGvd)
    if [] != results:
      print(iGroup)
      display_gvd_list(results, criterion)

"""
  Display given gvd, referenced by its uuid
"""
def display_given_uuid(uuid, criterion):
  display_gvd_list(get_gvd(uuid), criterion)

"""
  Display gvd by number of definition in rules
"""
def display_by_number_of_def_in_rules(criterion='usage'):
  names = []
  ids = []
  usage = []
  rules = common.get_rules()
  directives = common.get_directives()
  for iDirective in directives:
    names.append(iDirective.displayName)
    ids.append(iDirective.id)
    usage.append(len(iDirective.usedIn(rules)))

  toDisplay = [
     { "title": "Name", "value": names },
     { "title": "id", "value": ids },
     { "title": "usage", "value": usage }
  ]
  print(common.dictToAsciiTable(common.sortToDisplay(toDisplay, criterion)))
  print("With a total of %s rules found"%len(rules))

"""
  Display gvd by number of definition in directives
"""
def display_by_number_of_def_in_directives(criterion='Defined in x directives'):
  gvds = get_all()

  results = {}
  for gvd in gvds:
    if gvd.name not in results:
      results[gvd.name] = {
         'nbDirectives': set(),
         'values': set()
      }
    results[gvd.name]['nbDirectives'].add(gvd.directive)
    results[gvd.name]['values'].add(gvd.value)

  names = []
  nbValues = []
  nbDirectives = []
  for k in results.keys():
    names.append(k)
    nbValues.append(len(results[k]['values']))
    nbDirectives.append(len(results[k]['nbDirectives']))

  toDisplay = [
     { "title": "Name", "value": names },
     { "title": "Take x different values", "value": nbValues },
     { "title": "Defined in x directives", "value": nbDirectives }
  ]
  print(common.dictToAsciiTable(common.sortToDisplay(toDisplay, criterion)))
