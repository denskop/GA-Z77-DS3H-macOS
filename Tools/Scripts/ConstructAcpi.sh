if [ -z "$SELF_PATH" ]; then
    echo "Use Build.sh, aborting..."
    exit 1
fi

BUILD_PATH="$SELF_PATH/Build"

# Make build dir
mkdir -p "$BUILD_PATH" > /dev/null

# Copy acpi extra files
pushd "$ACPI_EXTRA_PATH" > /dev/null
find . -name '*.aml' -exec mv {} "$BUILD_PATH" \;
popd > /dev/null

# Copy acpi files
pushd "$TEMP_PATH/Dsl" > /dev/null
find . -name '*.aml' -exec mv {} "$BUILD_PATH" \;
popd > /dev/null