try:
  import configparser
  config = configparser.ConfigParser()
except ImportError:
  import ConfigParser
  config = ConfigParser.ConfigParser()

## GLOBAL VARIABLES
CONFIG_FILE = "~/.rudder-dev"

# Default error template
ERROR_TPL = "\033[1;31m{}\033[0m"


###
###  Internal functions
### 

# Run a command in a shell like a script would do
# And inform the user of its execution
def shell(command, comment=None, keep_output=False, fail_exit=True):
  if comment is not None:
    print(comment)
    print(" $ " + command)
  if keep_output:
    process = Popen(command, stdout=PIPE, shell=True)
    output, error = process.communicate()
    retcode = process.poll()
  else: # keep tty management and thus colors
    process = Popen(command, shell=True)
    retcode = process.wait()
    output = None
  if fail_exit and retcode != 0:
    if comment is None:
      print(command)
    logfail("*** COMMAND ERROR " + str(retcode))
    if not force:
      exit(1)
  if keep_output:
    if sys.version_info[0] != 2:
      output = output.decode("utf-8")
  if not fail_exit:
    return (retcode, output)
  else:
    return output


def logfail(message):
  print(ERROR_TPL.format(message))

# Read rudder configuration from ~/.rudder-dev or create a template if none found
def read_configuration():
  global UPSTREAM_REPOSITORY, OWN_REPOSITORY, GITHUB_TOKEN, REDMINE_TOKEN, REDMINE_ALT_TOKEN, ERROR_TPL

  # Detect missing configuration
  if not os.path.isfile(os.path.expanduser(CONFIG_FILE)):
    with open(os.path.expanduser(CONFIG_FILE), 'a') as cfile:
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
    print(CONFIG_FILE + " doesn't exist !")
    logfail("I made a sample one, please fill it")
    exit(5)
  
  # Read configuration
  config.read(os.path.expanduser(CONFIG_FILE))
  UPSTREAM_REPOSITORY = get_config("nrm_upstream", "No 'nrm_upstream' entry in " + CONFIG_FILE)
  OWN_REPOSITORY = get_config("own_upstream", "No 'own_upstream' entry in " + CONFIG_FILE)
  GITHUB_TOKEN = get_config("github_token", None)
  REDMINE_TOKEN = get_config("redmine_token", None)
  REDMINE_ALT_TOKEN = get_config("redmine_alt_token", None)
  ERROR_TPL = get_config("error_tpl", None)
  if ERROR_TPL is None:
    ERROR_TPL = "\\033[1;31m{}\\033[0m"
  # replace \\Oxx characters by their octal equivalent
  ERROR_TPL = re.sub(r'(\\0\d+)', lambda x: chr(int(x.group(0)[1:],8)), ERROR_TPL)


# Get a configuration item from current configuration file
def get_config(item, error):
  try:
    return config.get("default", item)
  except:
    if error is None:
      return None
    else:
      logfail(error)
      exit(5)

