#!/bin/bash
# 1st argument - name of new app for meteor
# 2nd argument - remote origin for git
STARTTIME=$(date +%s)

cd $HOME
meteor create $1
cd $1
rm -f $1.css
rm -f $1.html
rm -f $1.js

# remove some meteor packages
meteor remove autopublish insecure

# add needed meteor packages
meteor add accounts-facebook accounts-google accounts-password jquery email spiderable
mrt add iron-router 
mrt add accounts-ui-bootstrap-3 
mrt add i18next-meteor 
mrt add cookie
mrt add bootstrap-3

# move template files
cp -r ~/setup/app-tmp/client/ ~/$1/
cp -r ~/setup/app-tmp/lib/ ~/$1/
cp -r ~/setup/app-tmp/public/ ~/$1/
cp -r ~/setup/app-tmp/server/ ~/$1/
cp ~/setup/app-tmp/model.js ~/$1/


# git init
# git remote add origin $2
# git add .
# git commit -m 'initial set up of the app'
# git push -u origin --all

ENDTIME=$(date +%s)
echo "It took $(($ENDTIME - $STARTTIME)) seconds to complete this task..."
