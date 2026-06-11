#!/bin/bash

# Automated Project Bootstrapping Script
# Creates attendance tracker project structure

# Get project name
read -p "Enter project name: " name

PROJECT="attendance_tracker_$name"

# Create directories
mkdir -p "$PROJECT/Helpers"
mkdir -p "$PROJECT/reports"

# Create files
touch "$PROJECT/attendance_checker.py"
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

fi
