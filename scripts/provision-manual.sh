#!/bin/bash

oc new-project dev --display-name="Tasks - Dev"
oc new-project stage --display-name="Tasks - Stage"
oc new-project cicd --display-name="CI/CD"

oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n dev
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n stage

oc new-app -n cicd -f https://raw.githubusercontent.com/mipam007/pipeline/master/OpenShiftTemplates/cicd-template.yaml --param DEV_PROJECT=dev --param STAGE_PROJECT=stage

