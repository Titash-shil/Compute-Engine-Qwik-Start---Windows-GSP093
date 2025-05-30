#!/bin/bash

# Define color variables
BLACK_TEXT=$'\033[0;90m'
RED_TEXT=$'\033[0;91m'
GREEN_TEXT=$'\033[0;92m'
YELLOW_TEXT=$'\033[0;93m'
BLUE_TEXT=$'\033[0;94m'
MAGENTA_TEXT=$'\033[0;95m'
CYAN_TEXT=$'\033[0;96m'
WHITE_TEXT=$'\033[0;97m'

NO_COLOR=$'\033[0m'
RESET_FORMAT=$'\033[0m'

# Define text formatting variables
BOLD_TEXT=$'\033[1m'
UNDERLINE_TEXT=$'\033[4m'

clear


# Instruction to check authentication
gcloud auth list

# Instruction to set the zone
export ZONE=$(gcloud compute project-info describe --format="value(commonInstanceMetadata.items[google-compute-default-zone])")

# Instruction to create the instance
gcloud compute instances create qwiklabexplorers --project=$DEVSHELL_PROJECT_ID --zone $ZONE --machine-type=e2-medium --create-disk=auto-delete=yes,boot=yes,device-name=qwiklabexplorers,image=projects/windows-cloud/global/images/windows-server-2022-dc-v20230913,mode=rw,size=50,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced 

# Instruction to wait for the instance to initialize
sleep 30

# Instruction to get serial port output
gcloud compute instances get-serial-port-output qwiklabexplorers --zone=$ZONE

# Instruction to reset the Windows password
gcloud compute reset-windows-password qwiklabexplorers --zone $ZONE --user admin --quiet

# Completion message

echo -e "${BLUE_TEXT}${BOLD_TEXT}Subscribe my Channel (QwikLab Explorers):${RESET_FORMAT} ${GREEN_TEXT}${BOLD_TEXT}https://www.youtube.com/@qwiklabexplorers${RESET_FORMAT}"
