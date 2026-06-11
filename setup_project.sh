#!/bin/bash

PROJECT=""

# Automated Project Bootstrapping Script
# Creates attendance tracker project structure

# Handle Ctrl+C (SIGINT)
trap cleanup SIGINT

cleanup() {

    echo ""
    echo "⚠ Script interrupted!"

    # Only run if project name was already created
    if [ -n "$PROJECT" ] && [ -d "$PROJECT" ]; then

        tar -czf "${PROJECT}_archive.tar.gz" "$PROJECT"
        rm -rf "$PROJECT"

        echo "Archive created: ${PROJECT}_archive.tar.gz"
    else
        echo "No project created yet. Nothing to archive."
    fi

    echo "Cleanup completed"
    exit 1
}

# Automated Project Bootstrapping Script
# Creates attendance tracker project structure

# Get project name
read -p "Enter project name: " name

PROJECT="attendance_tracker_$name"

# Create directories
mkdir -p "$PROJECT/Helpers"
mkdir -p "$PROJECT/reports"

# Create files
echo "# Attendance Checker Script" > "$PROJECT/attendance_checker.py"
touch "$PROJECT/Helpers/assets.csv"

# Create config file with default values
cat > "$PROJECT/Helpers/config.json" <<EOF
{
  "Warning": 75,
  "Failure": 50
}
EOF

# Create reports file
touch "$PROJECT/reports/reports.log"

# Ask user if they want to update thresholds
read -p "Do you want to update thresholds? (y/n): " answer

# If user chooses yes, collect new threshold values
if [ "$answer" = "y" ]; then

    # Get warning threshold percentage
    read -p "Enter Warning percentage: " warning

    # Get failure threshold percentage
    read -p "Enter Failure percentage: " failure

    # Update Warning value inside config.json using sed
    sed -i "s/\"Warning\": [0-9]*/\"Warning\": $warning/" "$PROJECT/Helpers/config.json"

    # Update Failure value inside config.json using sed
    sed -i "s/\"Failure\": [0-9]*/\"Failure\": $failure/" "$PROJECT/Helpers/config.json"

fi

# Environment check
echo "Checking Python installation..."

if python3 --version >/dev/null 2>&1
then
    echo "Python3 is installed"
else
    echo "Warning: Python3 not found"
fi

# Show final structure
echo "Project created successfully"
ls -R "$PROJECT"
