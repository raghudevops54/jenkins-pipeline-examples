pipeline {
  agent any

  environment {
    SURL = "global.example.com"
    SLACK_TOKEN = credentials('slack')
  }

  parameters {
    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
    text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')
    booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')
    choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
    password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
  }

  stages {
    stage('Hello') {
      environment {
        SURL = "local.example.com"
      }
      steps {
        sh 'echo ${SURL}'
        sh 'echo ${SLACK_TOKEN}'
        sh 'PERSON NAME = ${PERSON}'
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
      slackSend channel: '#random', message: "Failed Job - URL = ${SURL1}"
    }
  }

}
