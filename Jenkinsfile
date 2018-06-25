def workspace;

node
{
  stage('stage1')
{
    echo "This is stage1"
}

stage('Checkout')
{
    echo "This is stage2. Git checkout !!!"
    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'Github', url: 'https://github.com/pradip10/log_parse.git']]])
}

stage('stage3')
{
    echo "This is stage3"
}

}
