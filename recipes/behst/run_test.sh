#!/bin/bash
set -euo pipefail

# download script dumps progress to stdout, causing too-large log output on
# travis. Dump to temp log and only report if it fails.
echo "Downloading (log in /tmp/download.log)"
download_behst_data.sh /tmp/behst --small &> /tmp/download.log || cat /tmp/download.log

behst.py /tmp/behst/pressto_LUNG_enhancers.bed /tmp/behst