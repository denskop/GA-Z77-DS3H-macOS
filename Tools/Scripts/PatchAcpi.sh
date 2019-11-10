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

# Remove ssdt tables
rm SSDT_SataTabl.dsl

## Patch acpi tables

# DSDT

# Fix ACPI errors (Minimum set for compilation)
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixErrors.txt

# Fix ACPI warnings (from IASL)
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixWarnings.txt

# Dependencies
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_Rename.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_RemoveDSM.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_AppleSpecific.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixWAK.txt

# Fix macOS errors (bad work)
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixIRQ.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_AddFakeEC.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixOSC.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixPRW.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixEHCI.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixXHCI.txt

# Other fixes
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_RemoveEC.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixPNOT.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixSxStates.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixUID.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_FixGFX0.txt
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_AddOther.txt

# Apple style fixes
$PATCH "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_HideUseless.txt

## Patch2 acpi tables

$PATCH2 "$TEMP_PATH/Dsl/"MCFG.dsl "$ACPI_PATCHES_PATH/"MCFG.txt
$PATCH2 "$TEMP_PATH/Dsl/"DSDT.dsl "$ACPI_PATCHES_PATH/"DSDT_Header_iMac.txt

popd > /dev/null