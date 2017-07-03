#!/bin/sh

# POST-COMMIT HOOK

# fail on error
set -e

# commands
CURL=/usr/bin/curl
SVNLOOK=/usr/bin/svnlook

# function that returns the committed project in $1, using $REPOS as $2
parse_project() {
  PROJECT=''
  DIRS=`$SVNLOOK dirs-changed $2`

  # get first line of dirs-changed
  for DIR in $DIRS:
  do
    # split on "/" and get first part of array
        for PATH in $(echo $DIR | tr "/" "\n")
    do
          PROJECT=$PATH
          break
    done
    break
  done
  eval "$1=$PROJECT"
}

# known projects
COUNTRY_SERVICE='countryservice'

# inspect commit to get committed project
REPOS="$1"
REV="$2"
TXN_NAME="$3"

PROJECT=''
parse_project PROJECT $REPOS

# output project in case of error
>&2 echo repos: "$REPOS"
>&2 echo rev  : "$REV"
>&2 echo txn  : "$TXN_NAME"
>&2 echo project: $PROJECT

# init variables
JENKINS_URL=https://jenkins-jenkins.192.168.99.100.nip.io
JENKINS_USER=developer-admin
JENKINS_USER_TOKEN=5d2bf1c8b25fe17530101e15f357d82d
JENKINS_JOB=''
JOB_TOKEN=''

# bypass any proxy's
export http_proxy=''
export https_proxy=''

# NB! sh is used instead of bash, so a single = for string comparison, not ==
if [ "$COUNTRY_SERVICE" = "$PROJECT" ];
then
  # job specific variables
  JENKINS_JOB=countrservice-SVN-PIPELINE
  JOB_TOKEN=Cl30patra

  # perform call
  $CURL --insecure --user $JENKINS_USER:$JENKINS_USER_TOKEN $JENKINS_URL/job/$JENKINS_JOB/build?token=$JOB_TOKEN
else
  >&2 echo expected: "$COUNTRY_SERVICE"
  exit 1
fi

exit 0
