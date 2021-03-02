pipeline {
  agent any

  stages {
    stage('Hello') {
      steps {
        sh 'sleep 1000'
      }
    }

    stage('Hello1') {
      steps {
        echo 'hello world 1'
      }
    }
  }

  post {
    always {
      slackSend channel: '#random', message: 'Hello'
    }
  }

}