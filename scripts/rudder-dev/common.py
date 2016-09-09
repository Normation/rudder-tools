import os
import re
from subprocess import Popen,PIPE
from pprint import pprint

try:
  import configparser
  config = configparser.ConfigParser()
except ImportError:
  import ConfigParser
  config = ConfigParser.ConfigParser()



class Config:
  """Pseudo class used to share global configuration"""
  # Other values are read from this file by read_configuration()
  CONFIG_FILE = "~/.rudder-dev"
  # Default error template (needed by config file parsing)
  ERROR_TPL = "\033[1;31m{}\033[0m"
  # Default force mode (needed because not necessary set)
  force = False
  # Common config
  QA_TEST = "qa-test"


###
###  Internal functions
### 

# Run a command in a shell like a script would do
# And inform the user of its execution
def shell(command, comment=None, keep_output=False, fail_exit=True, keep_error=False):
  if comment is not None:
    print(comment)
    print(" $ " + command)
  if keep_output or keep_error:
    if keep_output:
      keep_out = PIPE
    else:
      keep_out = None
    if keep_error:
      keep_err = PIPE
    else:
      keep_err = None
    process = Popen(command, stdout=keep_out, stderr=keep_err, shell=True, universal_newlines=True)
    output, error = process.communicate()
    retcode = process.poll()
  else: # keep tty management and thus colors
    process = Popen(command, shell=True)
    retcode = process.wait()
    output = None
    error = None
  if fail_exit and retcode != 0:
    if comment is None:
      print(command)
    logfail("*** COMMAND ERROR " + str(retcode))
    if not Config.force:
      exit(1)
  if not fail_exit:
    return (retcode, output, error)
  else:
    return output


def logfail(message):
  print(Config.ERROR_TPL.format(message))

# Read rudder configuration from ~/.rudder-dev or create a template if none found
def read_configuration(section=None):
  # Detect missing configuration
  if not os.path.isfile(os.path.expanduser(Config.CONFIG_FILE)):
    with open(os.path.expanduser(Config.CONFIG_FILE), 'a') as cfile:
      cfile.write("""[default]
## Uncomment and set your own values
## Your prefered name for Normation upstream repository on your local git (NRM, origin, ...)
#nrm_upstream = NRM
## Your prefered name for personal upstream repository on your local git (ABC, origin, ...)
#own_upstream =
## If github cli is installed, rudder-dev will read hub's configuration file to get the user's github token
## Otherwise, yo manage your tokens, click here https://github.com/settings/tokens (click "Generate new token")
# github_token = 
## Redmine personal access token, get yours here http://www.rudder-project.org/redmine/my/account (under "API access key")
#redmine_token = 
## For Normation people only
#redmine_alt_token = 
## For colorblind or dumb terminal change ansicode here (ref: http://pueblo.sourceforge.net/doc/manual/ansi_color_codes.html)
## Do no forget to add keeep {} to have the text content
#error_tpl = \\033[1;31m{}\\033[0m
""")
    print(Config.CONFIG_FILE + " doesn't exist !")
    logfail("I made a sample one, please fill it")
    exit(5)
  
  # Read ERROR_TPL first since it can be used just after
  Config.ERROR_TPL = get_config("error_tpl", None, section)
  if Config.ERROR_TPL is None:
    Config.ERROR_TPL = "\\033[1;31m{}\\033[0m"
  # replace \\Oxx characters by their octal equivalent
  Config.ERROR_TPL = re.sub(r'(\\0\d+)', lambda x: chr(int(x.group(0)[1:],8)), Config.ERROR_TPL)

  # Read configuration
  config.read(os.path.expanduser(Config.CONFIG_FILE))
  Config.UPSTREAM_REPOSITORY = get_config("nrm_upstream", "No 'nrm_upstream' entry in " + Config.CONFIG_FILE, section)
  Config.OWN_REPOSITORY = get_config("own_upstream", "No 'own_upstream' entry in " + Config.CONFIG_FILE, section)
  Config.GITHUB_TOKEN = get_config("github_token", None, section)
  Config.REDMINE_TOKEN = get_config("redmine_token", None, section)
  Config.REDMINE_ALT_TOKEN = get_config("redmine_alt_token", None, section)


# Get a configuration item from current configuration file
def get_config(item, error, section):
  try:
    # try [section] first
    if section is not None:
      try:
        return config.get(section, item)
      except:
        pass
    # use [default] otherwise
    return config.get("default", item)
  except:
    if error is None:
      return None
    else:
      logfail(error)
      exit(5)

