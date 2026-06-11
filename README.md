# Automated Project Bootstrapping & Process Management

## Project Description
This is a shell script that automatically creates a full attendance tracking project structure using Bash automation.

## How the Script Works
- Prompts the user for a project name
- Creates a structured project directory
- Generates required files and folders automatically
- Creates a default configuration file (config.json)
- Allows user to update Warning and Failure thresholds
- Uses sed to update configuration values dynamically
- Handles Ctrl+C (SIGINT) to safely archive and clean up incomplete projects
- Checks if Python3 is installed on the system
- Displays final project structure

## Running the Script

Run the script using:

```bash
bash setup_project.sh

## Video Explanation

Google Drive Link:
https://drive.google.com/file/d/1QAW4WScLODyJbuyN06-Op7n8m-CDrYi5/view?usp=sharing
