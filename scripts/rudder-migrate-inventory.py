#!/usr/bin/env python
# -*- coding: utf-8 -*-

# need python lxml library. On most distribution, it comes with
# with the default Python installation as it is quite common. 

# Centos7: the package needed is: 
# yum install python-lxml

# Arch
# pacman -Sy python-lxml

# Debian
# sudo apt-get install -y python-lxml 
# sudo pip3 install lxml

# You can also use pip to install the package. 
# On some case, it seems broken and need devel package, 
# for example in Centos: # see: http://stackoverflow.com/questions/20886069/cant-install-lxml-on-centos
# yum install yum install libxslt-devel libxml2-devel 
# pip install lxml


from lxml import etree
import sys
from shutil import copyfile

def help():
  print("""
A script that allows to transform inventory file for Rudder 2.x branch
into inventory file for Rudder 3.2+ branch. 


Usage:
  rudder-migrate-inventory source-inventory-2.x.ocs destination-name.ocs
""")


def migrate(source_file, dest_file):
  try:
    tree = etree.parse(source_file)

    # if <RUDDER> tag is here, just abort
    if tree.xpath("//RUDDER"):
      print("<RUDDER> tag already present, not need to migrate " + source_file + " (simple copy to "+ dest_file + ")")
      copyfile(source_file, dest_file)
      exit(0)

    content = tree.xpath("/REQUEST/CONTENT")[0]

    # adding a <RUDDER> tag 
  
    rudder = etree.SubElement(content, "RUDDER")
    rudder.append(tree.xpath("/REQUEST/UUID")[0])
    rudder.append(tree.xpath("/REQUEST/HOSTNAME")[0])
    # processors is not mandatory
    processors = tree.xpath("/REQUEST/PROCESSORS")
    if processors:
      rudder.append(processors[0])
    
    # Adding <RUDDER><AGENT>, now mandatory
    
    agent = etree.SubElement(rudder, "AGENT")
    agent_name = etree.SubElement(agent, "AGENT_NAME")
    agent_name.text =  tree.xpath("/REQUEST/AGENTSNAME/AGENTNAME")[0].text
    policy_server = etree.SubElement(agent, "POLICY_SERVER_UUID")
    policy_server.text = tree.xpath("/REQUEST/POLICY_SERVER")[0].text
    owner = etree.SubElement(agent, "OWNER")
    owner.text = tree.xpath("/REQUEST/USER")[0].text

    # cfkey not mandatory
    keys = tree.xpath("/REQUEST/CFKEY")
    if keys:
      cfkey = etree.SubElement(agent, "CFENGINE_KEY")
      cfkey.text = keys[0].text
    
    tree.write(dest_file, pretty_print=True)

  except etree.XMLSyntaxError as e:
    log = e.error_log.filter_from_level(etree.ErrorLevels.FATAL)
    print("Can not parse file" + source_file + ", exception was:")
    print(log)

  except Exception as e:
    print("Exception when processing file " + source_file + ":")
    raise

# Main loop
if __name__ == "__main__":
  if len(sys.argv) != 3:
    help()
  else:
    migrate(sys.argv[1], sys.argv[2])  
