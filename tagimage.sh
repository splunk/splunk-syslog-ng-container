#!/usr/bin/env bash
regex='\((.*)\)'
IMAGE=$@
sv=$(docker run --rm docker.pkg.github.com/splunk/splunk-syslog-ng-container/splunk-syslog-ng-container:${IMAGE} --version | head -n 2 | tail -n 1 )
[[ $sv =~ $regex ]]
docker tag docker.pkg.github.com/splunk/splunk-syslog-ng-container/splunk-syslog-ng-container:${IMAGE} \
          docker.pkg.github.com/splunk/splunk-syslog-ng-container/splunk-syslog-ng-container:${BASH_REMATCH[1]}
docker push docker.pkg.github.com/splunk/splunk-syslog-ng-container/splunk-syslog-ng-container:${BASH_REMATCH[1]}