Backup Script

Introduction
This script provides a convenient way to backup directories with optional compression algorithm.

Requirements
- Linux or Unix-like operating system
- tar, gzip, bzip2, openssl installed

Usage
Syntax: ./backup.sh [-h] [-a algorithm] [-o output] [-d directory]

Options
-h, --help: Show help message
-a: Compression algorithm (gzip, bzip2, none)
-o: Output file name
-d: Directory to backup

Example
bash
./backup.sh -a gzip -o backup.tar.gz -d /path/to/directory