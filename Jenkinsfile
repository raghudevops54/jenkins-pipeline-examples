pipeline {
  agent any

  environment {
    SURL = "global.example.com"
    SLACK_TOKEN = credentials('slack')
  }

  options {
    disableConcurrentBuilds()
  }

  triggers {
    pollSCM('* * * * *')
  }

  tools {
    nodejs 'node-15'
  }

  parameters {
    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
    text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')
    booleanParam(name: 'PROD', defaultValue: false, description: 'Runs PROD Stage if choosen')
    choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
    password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
  }

  stages {
    stage('DEV') {
      environment {
        SURL = "local.example.com"
      }
      steps {
       sh 'node --version'
      }
    }

    stage('PROD') {
      when {
        expression {
          params.PROD
        }
      }
//      input {
//        message "Should we continue?"
//        ok "Yes, we should."
//        submitter "admin"
//      }
      steps {
        echo 'hello world 1'
      }
    }

    stage('Parallel Stages') {
      parallel {
        stages {
          stage('P1') {
            steps {
              sh 'sleep 100'
            }
          }
          stage('P2') {
            steps {
              sh 'sleep 110'
            }
          }
          
        }
      }
    }

  }

  post {
    aborted {
      slackSend channel: '#random', message: 'Hello'
    }
    always {
      slackSend channel: '#random', message: "Failed Job - URL = ${SURL}"
    }
  }

}
