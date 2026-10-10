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
    whitelist.txt

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

## Bonus 2 : Whitelist

The whitelist stores the filenames of files that have been restored from quarantine because they were false positives.

## Adding a file to whitelist
When the user selects option 1 (Restore) in restore.sh, the file is copied from the malicious directory  back to the original directory specified by the user. The quarantined copy is then removed, and the file's name is added to whitelist.txt using basename. This allows the daemon to remember that the file was previously restored as a false positive.

##  Checking the whitelist
Before checking a file's extension or contents, antivirusd.sh checks whether whitelist.txt exists. If it does, the daemon checks for an exact filename match in the whitelist. If a match is found, it skips the rest of the current loop iteration, so the file is not scanned or quarantined again. Since the whitelist is stored in a text file on disk, it persists across daemon restarts.


