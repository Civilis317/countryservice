node() {
  stage ('Configure') {
    env.JAVA_HOME = "${tool 'Java-8-jdk'}"
	env.PATH = "${tool 'Maven-3.5.0'}/bin:${env.PATH}"
    env.PATH = "${tool 'Java-8-jdk'}/bin:${env.PATH}"
  }
  
  stage('Checkout') {
	checkout([$class: 'SubversionSCM', additionalCredentials: [], excludedCommitMessages: '', excludedRegions: '', excludedRevprop: '', excludedUsers: '', filterChangelog: false, ignoreDirPropChanges: false, includedRegions: '', locations: [[credentialsId: 'reposerver-jenkins-user', depthOption: 'infinity', ignoreExternalsOption: true, local: '.', remote: 'http://192.168.99.90/svn/myrepo/countryservice/trunk']], workspaceUpdater: [$class: 'CheckoutUpdater']])
  }
  
  stage('Java-Build') {
	sh "mvn clean package"
  }
  
  stage ('OpenShift-Build-Deploy') {
	sh "chmod a+x ./run.sh"
	sh "./run.sh"
  }
}
