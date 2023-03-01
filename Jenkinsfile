#! /usr/bin/env groovy

pipeline {

  agent any
  environment {
    SPECTRAL_DSN = 'https://spu-d646eb36ff0d4aa1a11f6cd514cc1ad4@spectral-eu.checkpoint.com'
  }
  stages {
    stage('install Spectral') {
      steps {
        sh "curl -L 'https://spectral-eu.checkpoint.com/latest/x/sh?dsn=$SPECTRAL_DSN' | sh"
      }
    }
    stage('scan for issues') {
      steps {
        sh "$HOME/.spectral/spectral scan --fail-on-error  --include-tags base,audit"
      }
    }
  }
}
