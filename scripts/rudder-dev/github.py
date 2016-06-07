import sys
import json
import re
import requests # apt-get install python-requests || pip install requests

# trick to make fake import compatible with regular import
if 'Config' not in vars():
  from common import *
      
Config.HUB_CONFIG_FILE = "~/.config/hub"
Config.PR_VALIDATED_LABEL = "Ready for merge"
Config.BOT_CANNOT_MERGE = "qa: Can't merge"

class PR:
  """A Pull Request"""
  def __init__(self, url):
    self.url = url
    self.info = None
    match = re.search(r'.*?://.*?/(.*?)/(.*?)/pull/(\d+)(?:.*)?', url)
    if match:
      self.id = match.group(3)
      self.repo = match.group(2)
      self.upstream = match.group(1)
    else:
      raise ValueError("BUG: not a valid PR URL")

  def is_labeled(self, label):
    """Tell if the pull request is labeled with label"""
    url = "https://api.github.com/repos/Normation/{repo}/issues/{pr_id}/labels"
    label_list = github_request(url, None, self.url, repo=self.repo)
    labels = [x['name'] for x in label_list]
    return label in labels

  def _request_pr(self):
    if self.info is not None:
      return
    url = "https://api.github.com/repos/Normation/{repo}/pulls/{pr_id}"
    self.info = github_request(url, None, self.url, repo=self.repo)

  def repo(self):
    self._request_pr()
    return self.info['head']['repo']['ssh_url']

  def remote_branch(self):
    self._request_pr()
    return self.info['head']['ref']

  def base_branch(self):
    self._request_pr()
    return self.info['base']['ref']

  def comment(self, comment):
    url = "https://api.github.com/repos/Normation/{repo}/issues/{pr_id}/comments"
    data = { "body": comment }
    github_request(url, "Posting comment", self.url, json.dumps(data), repo=self.repo)

  def label(self, label):
    url = "https://api.github.com/repos/Normation/{repo}/issues/{pr_id}/labels"
    data = [ label ]
    github_request(url, "Changing label", self.url, json.dumps(data), repo=self.repo)


# Get github user as used by the hub command
def get_github_user():
  user_data=github_request("https://api.github.com/user", None)
  if 'login' in user_data:
    return user_data['login']
  else:
    logfail("Github user not found")
    exit(6)


# Get github token as used by the hub command
def get_github_token(can_fail=False):
  if Config.GITHUB_TOKEN is not None:
    return Config.GITHUB_TOKEN
  if os.path.isfile(os.path.expanduser(Config.HUB_CONFIG_FILE)):
    with open(os.path.expanduser(Config.HUB_CONFIG_FILE)) as f:
      for line in f:
        match = re.search(r'oauth_token: (\w+)', line)
        if match:
          return match.group(1)
  if can_fail:
    return None
  else:
    logfail("Github user not found")
    exit(6)


# query github
def github_request(api_url, comment, pr_url=None, post_data=None, repo=None):
  pr_id = None
  if pr_url is not None:
    # Validate PR url
    match = re.match(r'^http.*/(\d+)(/files|/commits)?$', pr_url)
    if match:
      pr_id = match.group(1)
    else:
      print("Can't find pull-request ID, you should warn the reviewer that you updated the pull-request")
      return False

  # get connection info
  if repo is None:
    repo = remote_repo()
  url = api_url.format(repo=repo, pr_id=pr_id)

  # Say what we are doing
  if comment is not None:
    print(comment)
    print(" $ api-call [...] " + url)

  return github_call(url, post_data)

def github_call(url, post_data=None):
  token = get_github_token()
  # make query
  if post_data is not None:
    if sys.version_info[0] == 2:
      post_data = post_data.encode('utf-8')
    ret = requests.post(url, headers = {'Authorization': 'token ' + token, 'Content-Type': 'application/json' }, data=post_data)
  else:
    ret = requests.get(url, headers = {'Authorization': 'token ' + token, 'Content-Type': 'application/json' })

  # process output
  if ret.status_code < 200 or ret.status_code >= 300:
    logfail("Github query error " + ret.reason)
    print(ret.text)
    if not force:
      exit(12)

  # return result
  return ret.json()

