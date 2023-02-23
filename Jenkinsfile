#! /usr/bin/env groovy

pipeline {

  agent any
  environment {
    SPECTRAL_DSN = 'https://spu-a0d55bfbdb2e40eba90dfcc1ac32a073@get.spectralops.io'
  }
  stages {
    stage('install Spectral') {
      steps {
        sh "curl -L 'https://spectral-eu.checkpoint.com/latest/x/sh?dsn=$SPECTRAL_DSN' | sh"
      }
    }
    stage('scan for issues') {
      steps {
        sh "$HOME/.spectral/spectral scan --ok  --include-tags base,audit"
      }
    }
  }
}
