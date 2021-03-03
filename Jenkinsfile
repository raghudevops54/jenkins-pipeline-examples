pipeline {
  agent any

  environment {
    URL = "global.example.com"
  }

  stages {
    stage('Hello') {
      steps {
        sh 'echo ${URL}'
      }
    }

    stage('Hello1') {
      steps {
        echo 'hello world 1'
      }
    }
  }

  post {
    aborted {
      slackSend channel: '#random', message: 'Hello'
    }
    failure {
      slackSend channel: '#devopscom', message: 'Failed Job - URL = ${URL}'
    }
  }

}
