sf demoutil org create scratch -f config/project-scratch-def.json -d 1 -s -p mobpub -e pub.workshop

# install mobile publisher managed packages https://help.salesforce.com/articleView?id=branded_apps_playground_getstarted.htm&type=5
sf package install --package 04t1I000003RkFQQA0 --publish-wait 60 --wait 60
sf package install --package 04t1I000003RkFaQAK --publish-wait 60 --wait 60
sfdx shane:github:package:install -g mshanemc -r community-boilerplate

sf project deploy start
sf org assign permset --perm-set-name WorkshopPerms
sf data create record --sobject Account --values "Name='Default Partner'"
sf demoutil user password set -p salesforce1 -g User -l User

sf org open
