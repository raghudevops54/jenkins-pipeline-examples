pipeline {
  agent any

  stages {
    stage('Hello') {
      steps {
        sh 'false'
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
  }

}