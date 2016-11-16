#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
(crontab -l ; echo "00 00 * * * "$dir"/mkbackup.sh") | sort | uniq | crontab
