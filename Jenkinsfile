pipeline {
  agent any

  stages {
    stage('Hello') {
      steps {
        sh 'sleep 30'
      }
    }

    stage('Hello1') {
      steps {
        echo 'hello world 1'
      }
    }
  }

  aborted {
     {
      slackSend channel: '#random', message: 'Hello'
    }
  }

}