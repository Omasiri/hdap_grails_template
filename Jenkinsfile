#!/usr/bin/env groovy
pipeline{

    agent any

    stages{
        
        stage('Deploy'){
            steps{
                script{
                    docker.withRegistry('https://build.hdap.gatech.edu'){
            			def mac = docker.build("mac:${env.BUILD_NUMBER}", ".")
                        mac.push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }

        stage('Notify'){
            steps{
                script{
                    rancher confirm: true, credentialId: 'rancher-server', endpoint: 'https://rancher.hdap.gatech.edu/v2-beta', environmentId: '1a7', environments: '', image: "build.hdap.gatech.edu/mac:${env.BUILD_NUMBER}", ports: '', service: 'Managing-Anti-Coagulation/webapp', timeout: 50
                }
            }
        }
        
    }
    
}
