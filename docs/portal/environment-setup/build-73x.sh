#!/bin/bash
# set variables OAUTH_TOKEN, user, branch

GITHUB_OAUTH_TOKEN=
user=
branch=

cd /source/ && \
rm -rf $user-liferay-portal-ee*/ && \
wget --header="Authorization: token $GITHUB_OAUTH_TOKEN" -O - https://api.github.com/repos/$user/liferay-portal-ee/tarball/$branch | tar xz && \
cd $user-liferay-portal-ee*/ && \
echo "app.server.type=websphere" > app.server.root.properties && \
(echo "liferay.home=/source/bundles" ; echo "setup.wizard.enabled=false") > ./portal-impl/src/portal-ext.properties && \
ant all
