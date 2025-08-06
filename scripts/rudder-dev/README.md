# rudder-dev

`rudder-dev` is our internal tool that manages the boilerplate around our convention for addressing an issue, making a PR in the correct branch, and general interactions between [`issues.rudder.io`](http://issues.rudder.io) and `github.com/normation`.

The tool is part of `rudder-tools` repository and sources can be found at: [https://github.com/Normation/rudder-tools/tree/master/scripts/rudder-dev](https://github.com/Normation/rudder-tools/tree/master/scripts/rudder-dev) 

# Install

`rudder-dev` is a Python 3 script. It’s published in our repository.

Quick install (assuming a Linux distro and `/usr/local/bin` being in path):

```bash
curl https://repository.rudder.io/tools/rudder-dev > /usr/local/bin/rudder-dev && chmod +x /usr/local/bin/rudder-dev
```

The tools needs following dependencies: 

- **requests**: `pip install requests` or typically named `python-requests` in your distro package manager
- **docopt**: `pip install docopt` or typically named `python-docopt` in your distro package manager
- **dateutil**: `pip install python-dateutil` or typically named `python3-datetutil` in your distro package manager
- **pylint**: `pip install pylint` or typically named `pylint` in your distro package manager (beware of old python 2 versions)
- **dateutil**: `pip install python-dateutil` or typically named `python3-datetutil` in your distro package manager
- **shellcheck:** typically named `ShellCheck` in your distro package managers

# Configuration

`rudder-dev` needs a configuration files where GitHub and bugtracker-related information is stored. 

## Path

The configuration file is located at `~/.rudder-dev`.

## Init & config

An empty template is created for you the first time `rudder-dev` is run. So run the tool one time, and complete the generated template. 

You will need: 

- a GitHub account with your (a) personal API token from [https://github.com/settings/tokens/new](https://github.com/settings/tokens/new)
- a Rudder bugtracker account from [https://issues.rudder.io](https://issues.rudder.io) and corresponding API token from [https://issues.rudder.io/my/account](https://issues.rudder.io/my/account) (manage in the left part of the page)

Parameters should be commented enough to be explicit.

You also need to configure the name of the Git remotes:

```
nrm_upstream = NRM
own_upstream = <your-name>
```

When cloning a repository with `rudder-dev clone` the remotes will automatically be set to these values.
It is easier to start from a fresh clone if you already have one (or you can create the remotes manually).

# Usage

`rudder-dev --help` gives you a complete view of the usage of the tool. The main use cases are explained below. 

## Take ownership of an issue and work on it

### Existing issue set-up

In Rudder, we mandate that any code change is tracked by an issue. So the work hypothesis is that such an issue exists. 

![issue](images/issue.png)

The issue: 

- must have the correct tracker (1) (`user story`, `enhancement`, `bug`, `architecture`) and clear, short title (2). They will be used to generate the name for the local git branch based on template `${tracker prefix}_${issue number}/${lower_case_name_with_underscores}`.
    - In the example: `ust_20111/display_directive_tags_in_rule_details`
- must have the correct target version (3). It will be used to choose the correct GitHub branch from which the working branch will be created, and later on the base branch for the pull request.

### Create a local branch, change status to in-progress

Go to the repository where the code to change is and just do:

```bash
rudder-dev 20111
```

Where `20111` is the ID number of the issue.

This will update your local repository (`git fetch`). Then, it will checkout the branch corresponding to the issue target version, update it (`git pull`), and create a new branch derived from it named accordingly to the template previously explained.

It will also update the bug tracker issue to set the user working on the issue and change the statue to “in progress”.

Now you just have to work on your local branch until you’re happy.

### Commiting a work-in-progress

If at some point you want to share a WIP of your code, use:

```bash
rudder-dev wip [trigram]
```

It will create a draft pull request on GitHub. You can optionally add a trigram to assign it to a reviewer, or leave it empty if you want to do it later.

### Commiting for review

Once you’re happy with your code and tests, and have run the linter (e.g., for scala code: `mvn spotless:apply`), you can commit your code so that a reviewer can review it. 

Use the command: 

```bash
rudder-dev commit [trigram]
```

Where `[trigram]` is the identifier trigram for the reviewer. If you don’t specify `[trigram]`, `rudder-dev` will ask for it interactively. 

Then, `rudder-dev` will:

- create a commit with a commit message with the correct syntax to trigger the link with the issue (ie `Fixes #20111: Name of the issue`)
- push it on a remote branch on your own repo,
- create a pull-request and assign it to the reviewer,
- update the issue status to set it to “waiting for review”, changing the actor accordingly,
- update the issue to add the link to the PR

You still have to go to the PR and add an interesting description explaining what are the main change provided by it, what architecture impact it has, or anything that will help the reviewer understand what you did and why like that. 

### Correct your code post-PR

It happens (we know, extremely rarely, but it happens) that you have to provide some changes in your code, and they are somehow minor. In that case, you can just change your code and use: 

```bash
rudder-dev fixup
```

It will create a commit that has the correct syntax to be smashed upon merge and push it to your PR. 

## Other usages

Read the help or ask Rudder dev!
