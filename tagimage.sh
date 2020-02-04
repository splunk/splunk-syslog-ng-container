#!/usr/bin/env bash
regex='\((.*)\)'
sv=$(docker run --rm docker.pkg.github.com/splunk/splunk-syslog-ng-container/splunk-syslog-ng-container:$@ --version | head -n 2 | tail -n 1 )
[[ sv =~ $regex ]]
docker tag docker.pkg.github.com/splunk/splunk-syslog-ng-container/splunk-syslog-ng-container:$@ \
          docker.pkg.github.com/splunk/splunk-syslog-ng-container/splunk-syslog-ng-container:${BASH_REMATCH[1]}
docker push docker.pkg.github.com/splunk/splunk-syslog-ng-container/splunk-syslog-ng-container:${BASH_REMATCH[1]}