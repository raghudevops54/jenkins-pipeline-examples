pipeline {
  agent any

  environment {
    SURL = "global.example.com"
  }

  stages {
    stage('Hello') {
      steps {
        sh 'echo ${SURL}'
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
    always {
      slackSend channel: '#devopscom', message: "Failed Job - URL = ${SURL}"
    }
  }

}
