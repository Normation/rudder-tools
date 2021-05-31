class Rule:
  def __init__(self, data):
    self.id = data["id"]
    self.displayName = data["displayName"]
    self.shortDescription = data["shortDescription"]
    self.longDescription = data["longDescription"]
    self.system = data["system"]
    self.enabled = data["enabled"]
    self.directives = data["directives"]
    self.targets = data["targets"]
    self.tags = data["tags"]
    
  """
    return a list containing all groups listed in the include part
    of the target section of the current rule


    Rule api can define the targets in the following manners:
    
    "targets": [
      "group:2a3a1a8c-a2a0-446f-8347-849ad2d7fb15"
    ],
    
    
    or
    
    "targets": [
      {
        "include": {
          "or": [
            "group:f0e7d338-4a7b-4451-a64b-f83dd096d00f"
          ]
        },
        "exclude": {
          "or": []
        }
      }
    ],

  """
  def getIncludeTargets(self):
    include = []
    for iTarget in self.targets:
      if "include" in iTarget:
        for iGroup in iTarget["include"]["or"]:
          # remove all prefix in group id such as group:, special:, etc...
          include.append(iGroup.split(":", 1)[1])
      else:
        include.append(iTarget.split(":", 1)[1])
    return include
    
