FROM jenkins
MAINTAINER Jenkins Builds Eng "tzu.ta.lin@gmail.com"

# Install pre-installed plugins
RUN /usr/local/bin/install-plugins.sh  \
    ace-editor \
    ant \
    branch-api \
    build-timeout \
    display-url-api \
    docker-commons \
    docker-workflow \
    durable-task \
    docker-slaves \
    email-ext \
    external-monitor-job \
    gradle \
    handlebars \
    icon-shim \
    javadoc \
    locale \
    docker-plugin \
    role-strategy \
    copyartifact-plugin \
    envinject

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

# drop back to the regular jenkins user - good practice
# Switch back to the jenkins user
USER jenkins
