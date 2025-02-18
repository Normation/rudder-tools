@Library('slack-notification')
import org.gradiant.jenkins.slack.SlackNotifier

pipeline {
    agent none
    stages {
            stage('typos') {
                agent {
                    dockerfile {
                        label 'generic-docker'
                        filename 'ci/common.Dockerfile'
                        args '-u 0:0'
                    }
                }
                steps {
                    sh script: 'typos', label: 'check typos'
                }
                post {
                    failure {
                        script {
                            errors.add("check typos")
                            slackResponse = updateSlack(errors, running, slackResponse, version, changeUrl)
                            slackSend(channel: slackResponse.threadId, message: "Check typos on all plugins failed - <${currentBuild.absoluteUrl}console|Console>", color: "#CC3421")
                        }
                    }
                }
            }
            stage('shellcheck') {
                agent {
                    dockerfile {
                        label 'generic-docker'
                        filename 'ci/common.Dockerfile'
                        args '-u 0:0'
                    }
                }
                steps {
                    sh script: './qa-test --shell', label: 'shellcheck'
                }
                post {
                    always {
                        // linters results
                        recordIssues enabledForFailure: true, failOnError: true, sourceCodeEncoding: 'UTF-8',
                                     tool: checkStyle(pattern: '.shellcheck/*.log', reportEncoding: 'UTF-8', name: 'Shell scripts')
                    }
                    failure {
                        script {
                            errors.add("shell scripts")
                            slackResponse = updateSlack(errors, running, slackResponse, version, changeUrl)
                            slackSend(channel: slackResponse.threadId, message: "Check shell scripts on all plugins failed - <${currentBuild.absoluteUrl}console|Console>", color: "#CC3421")
                        }
                    }
                }
            }
            stage('python') {
                agent {
                    dockerfile {
                        label 'generic-docker'
                        filename 'ci/common.Dockerfile'
                        args '-u 0:0'
                    }
                }
                steps {
                    sh script: './qa-test --python', label: 'python scripts lint'
                }
                post {
                    failure {
                        script {
                            errors.add("python scripts")
                            slackResponse = updateSlack(errors, running, slackResponse, version, changeUrl)
                            slackSend(channel: slackResponse.threadId, message: "Check python scripts on all plugins failed - <${currentBuild.absoluteUrl}console|Console>", color: "#CC3421")
                        }
                    }
                }
            }
    }
}
