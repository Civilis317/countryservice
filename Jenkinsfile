node() {
  stage ('Configure') {
    env.JAVA_HOME = "${tool 'jdk8'}"
	env.PATH = "${tool 'Maven339'}/bin:${env.PATH}"
    env.PATH = "${tool 'jdk8'}/bin:${env.PATH}"
  }
  
  stage('Checkout') {
	#checkout([$class: 'SubversionSCM', additionalCredentials: [], excludedCommitMessages: '', excludedRegions: '', excludedRevprop: '', excludedUsers: '', filterChangelog: false, ignoreDirPropChanges: false, includedRegions: '', locations: [[credentialsId: 'reposerver-jenkins-user', depthOption: 'infinity', ignoreExternalsOption: true, local: '.', remote: 'http://192.168.99.90/svn/myrepo/countryservice/trunk']], workspaceUpdater: [$class: 'CheckoutUpdater']])
    checkout([$class: 'GitSCM', branches: [[name: '*/openshift']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Civilis317/countryservice.git']]])
  }
  
  stage('Java-Build') {
	sh "mvn clean package"
  }
  
  stage ('OpenShift-Build-Deploy') {
	sh "chmod a+x ./run.sh"
	sh "./run.sh"
  }
}
