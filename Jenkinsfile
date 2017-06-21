node() {
  stage ('Configure') {
    env.PATH = "${tool 'Maven-3.3.9'}/bin:${env.PATH}"
  }
  
  stage('Checkout') {
    git url: "https://github.com/Civilis317/countryservice.git", branch: 'develop'
  }
  
  stage('Build') {
    sh "mvn clean package"
  }
  
  stage ('Copy') {
    sh "ssh -p 2222 civilis@192.168.99.100 rm -rf /home/civilis/tmp/countryservice-dev"
    sh "ssh -p 2222 civilis@192.168.99.100 mkdir -p /home/civilis/tmp/countryservice-dev"
	sh "scp -p 2222 -r target civilis@192.168.99.100:/home/civilis/tmp/countryservice-dev/target"
  }
}

