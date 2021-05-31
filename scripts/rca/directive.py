import json
from pprint import pprint
class Directive:
  def __init__(self, data):
    self.id = data["id"]
    self.displayName = data["displayName"]
    self.shortDescription = data["shortDescription"]
    self.longDescription = data["longDescription"]
    self.techniqueName = data["techniqueName"]
    self.techniqueVersion = data["techniqueVersion"]
    self.priority = data["priority"]
    self.system = data["system"]
    self.enabled = data["enabled"]
    self.parameters = data["parameters"]
    self.tags = data["tags"]
    self.policyMode = data["policyMode"]

  def toJson(self):
    data = {
             "id": self.id,
             "displayName" : self.displayName,
             "shortDescription" : self.shortDescription,
             "longDescription" : self.longDescription,
             "techniqueName" : self.techniqueName,
             "techniqueVersion" : self.techniqueVersion,
             "priority" : self.priority,
             "system" : self.system,
             "enabled" : self.enabled,
             "parameters" : self.parameters,
             "tags" : self.tags,
             "policyMode" : self.policyMode
           }

    return json.dumps(data)

  def usedIn(self, rules):
    results = []
    for iRule in rules:
      if self.id in iRule.directives:
        results.append(iRule)
    return results

class GenericVariableDefinitionDirective:
  def __init__(self, directive):
    self.directive = directive

  def getVariables(self):
    variables = []
    for iSection in self.directive.parameters["section"]["sections"]:
      for iVar in iSection["section"]["vars"]:
        if iVar["var"]["name"] == "GENERIC_VARIABLE_NAME":
          name = "generic_variable_definition." + iVar["var"]["value"]
        elif iVar["var"]["name"] == "GENERIC_VARIABLE_CONTENT":
          value = iVar["var"]["value"]
      variables.append({ "name": name, "value": value })
    return variables

  def getValues(self, varName):
    variables = self.getVariables()
    return [ x["value"] for x in variables if x["name"] == varName ]

  def defines(self, varName):
    variables = self.getVariables()
    return any([ True for x in variables if x["name"] == varName ])
