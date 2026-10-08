# Simple Antivirus Daemon
## Overview

This project implements a simple antivirus daemon that periodically checks a directory for malicious files based on their file extensions and their contents.
Detected files are moved to a quarantine directory and deleted from the original directory.
The project also includes a restore script that allows the user to review quarantined files and either restore or permanently delete them. 

## Folder Hierarchy

9494-Lab2/
    antivirusd.sh
    restore.sh
    Makefile
    README.md
    dir/
    malicious_dir/

## Prerequisites 

This project uses Bash and Make.
On Ubuntu, install Make using:
sudo apt install make

## Running the project

## Running the antivirus
Use the Makefile to start up the antivirus daemon : make antivirus
The antivirus monitors `dir` and checks it every 2 seconds.
Malicious files are moved to `malicious_dir`

## Running the restore script
Use the Makefile to start up the restore script : make restore
The restore script lists the files in the quarantine directory and allows the user to restore a file, permanently delete it or leave it as-is.

## Flagged Extensions and Keywords for Malicious File Detection
The malicious file extensions and keywords are found in `antivirusd.sh`
The flagged extensions are `.exe`,`.bat`,`.vbs`,`.scr`,`.ps1`.
The flagged keywords are `virus`,`trojan`,`malware`,`worm`,`ransomware`.
