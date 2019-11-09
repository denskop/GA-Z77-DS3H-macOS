#!/bin/bash

SELF_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TOOLS_PATH="$SELF_PATH/Tools"
SCRIPTS_PATH="$TOOLS_PATH/Scripts"

## ACPI
source "$SCRIPTS_PATH/PatchAcpi.sh"