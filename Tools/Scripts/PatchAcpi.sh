if [ -z "$SELF_PATH" ]; then
    echo "Use Build.sh, aborting..."
    exit 1
fi

# Bios
BIOS_VERSION="F9"

# Paths
ACPI_EXTRA_PATH="$SELF_PATH/AcpiExtra"
ACPI_PATCHES_PATH="$SELF_PATH/AcpiPatches"
TEMP_PATH="/tmp"

# Tools
IASL="$TOOLS_PATH/iasl"
IASL_FLAGS=""
PATCH="$TOOLS_PATH/patchmatic"
PATCH2="$TOOLS_PATH/patch.sh"

# Paths
ORIGIN_PATH="$SELF_PATH/Origin${BIOS_VERSION}/"

# Remove dsl folder
rm -rf "$TEMP_PATH/Dsl"

# Avoid duplicates in origin path
mv "$ORIGIN_PATH/SSDT-1-Cpu0Ist.aml" "$ORIGIN_PATH/SSDT-x2_0-Cpu0Ist.aml"
rm "$ORIGIN_PATH/SSDT-x2_0-CpuPm.aml"

## Disassemble acpi tables

pushd "$ORIGIN_PATH" > /dev/null

# DSDT
$IASL -e SSDT*.aml -d DSDT.aml

# SSDT
$IASL -d SSDT*.aml

# Other tables
$IASL -d MCFG.aml

popd > /dev/null

# Move dsl
mkdir -p "$TEMP_PATH/Dsl"
mv "$ORIGIN_PATH/"*.dsl "$TEMP_PATH/Dsl"

# Rename ssdt tables
pushd "$TEMP_PATH/Dsl" > /dev/null

for ssdt in *; do
    mv "$ssdt" $(echo "$ssdt" | sed -e 's/-[0-9,_,x]*-/_/g')
done

## Patch2 acpi tables

$PATCH2 "$TEMP_PATH/Dsl/"MCFG.dsl "$ACPI_PATCHES_PATH/"MCFG.txt

popd > /dev/null