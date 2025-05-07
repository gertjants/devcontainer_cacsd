#!/bin/sh
if [ -z "${CONF_DIR}" ]; then
    CONF_DIR='/workspace/docker/config'
fi;

for env in "${CONF_DIR}"/env_*.yaml; do
    echo $env
    if [ -f "$env" ]; then
        echo "Ceating: ${env}" 
        ${MAMBA_ROOT_PREFIX}/bin/conda env create --yes -f ${env}
    fi
done
