#!/bin/sh

# deploy dockerfile in current folder

echo "oc version"
oc version
#oc login https://172.30.0.1:443 -udeveloper -pdeveloper --insecure-skip-tls-verify
oc login $OPENSHIFT_URL -u$OPENSHIFT_USER -p$OPENSHIFT_PWD --insecure-skip-tls-verify
oc project dev-svn
oc start-build openjdk --from-dir . --namespace="dev-svn" --follow
