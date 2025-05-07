FROM debian:trixie-slim

# Arguments
ARG SCRIPTS_DIR="/scripts"
ARG CONF_DIR="/config"
ARG USER="vscode"
ARG USER_UID=1001
ARG USER_GID=$USER_UID
ARG MAMBA_ROOT_PREFIX="/opt/conda"

# Env variables
ENV HOME="/home/${USER}" 
ENV MAMBA_ROOT_PREFIX=${MAMBA_ROOT_PREFIX}

# Installing base packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        wget \
        curl \
        openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Installing everything required for Python in VSCode
# Installing Python environment manager for scripts
COPY --chmod=755 scripts/install_miniforge.sh ${SCRIPTS_DIR}/install_miniforge.sh
RUN ${SCRIPTS_DIR}/install_miniforge.sh

# Creating non-root user
RUN groupadd --gid $USER_GID $USER --force \
    && useradd --uid $USER_UID --gid $USER_GID -m $USER -s /bin/bash \
    && chown -R ${USER}:${USER} ${HOME} \
    && chmod -R 755 ${HOME}

COPY --chmod=755 config/default.condarc.yaml ${HOME}/.condarc

RUN usermod -a -G conda ${USER}

# Swapping to user for final config.
USER $USER
WORKDIR ${HOME}

# Installing Python environments.
COPY --chmod=755 config/default.condarc.yaml /root/.condarc
COPY --chmod=755 config/*.yaml ${CONF_DIR}/
COPY --chmod=755 scripts/install_python_envs.sh ${SCRIPTS_DIR}/install_python_envs.sh
RUN ${SCRIPTS_DIR}/install_python_envs.sh