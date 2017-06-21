node('countryservice') {
  
  stage('Checkout') {
    git url: "https://github.com/muthai/springbootexample.git", branch: 'develop'
  }
  
  stage('Build') {
    sh "mvn clean package"
  }
  
  stage ('Copy') {
    sh "ssh civilis@192.168.99.100:2222 rm -rf /home/civilis/tmp/countryservice-dev"
    sh "ssh civilis@192.168.99.100:2222 mkdir -p /home/civilis/tmp/countryservice-dev"
	sh "scp -r target civilis@192.168.99.100:2222:/home/civilis/tmp/countryservice-dev/target"
  }
}

