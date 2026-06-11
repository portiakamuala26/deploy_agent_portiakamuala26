#!/bin/bash

# Automated Project Bootstrapping Script
# Creates attendance tracker project structure

# Get project name
read -p "Enter project name: " name

PROJECT="attendance_tracker_$name"

mkdir -p "$PROJECT/Helpers"
mkdir -p "$PROJECT/reports"

touch "$PROJECT/attendance_checker.py"
touch "$PROJECT/Helpers/assets.csv"

cat > "$PROJECT/Helpers/config.json" <<EOF
{
  "Warning": 75,
  "Failure": 50
}
EOF

touch "$PROJECT/reports/reports.log"
