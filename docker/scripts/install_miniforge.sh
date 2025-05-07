#!/bin/bash
mkdir /tmp/miniforge
cd /tmp/miniforge
echo "Fetching miniforge"

wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
chmod +x ./Miniforge3.sh

bash Miniforge3.sh -b  -p "${MAMBA_ROOT_PREFIX}"

source "${MAMBA_ROOT_PREFIX}/etc/profile.d/conda.sh"
# For mamba support also run the following command
source "${MAMBA_ROOT_PREFIX}/etc/profile.d/mamba.sh"

groupadd conda
chgrp -R conda "${MAMBA_ROOT_PREFIX}"
chmod 770 -R "${MAMBA_ROOT_PREFIX}"