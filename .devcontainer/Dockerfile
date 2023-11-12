FROM docker.io/zmkfirmware/zmk-build-x86_64:stable

COPY .bashrc tmp
RUN mv /tmp/.bashrc ~/.bashrc

ARG WORKPACE_PATH
ARG ZMK_URL
ARG ZMK_BRANCH
ARG ZMK_PATH

ENV PYTHONUNBUFFERED=1 \
    # prevents python creating .pyc files
    PYTHONDONTWRITEBYTECODE=1 \
    # pip
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    # poetry
    # https://python-poetry.org/docs/configuration/#using-environment-variables
    POETRY_VERSION=1.0.3 \
    # make poetry install to this location
    POETRY_HOME="/opt/poetry" \
    # make poetry create the virtual environment in the project's root
    # it gets named `.venv`
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    # do not ask any interactive question
    POETRY_NO_INTERACTION=1 \
    # paths
    # this is where our requirements + virtual environment will live
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/.venv" \
    PYENV_ROOT="/pyenv" \
    LANG=en_US.UTF-8 \
    PATH=$PATH:"/pyenv/bin"

RUN apt-get update
RUN apt-get install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev locales wget python-openssl python3 python3-pip
RUN cp /usr/bin/python3 /usr/bin/python
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
#Install pyenv and python 3.10
RUN git clone https://github.com/pyenv/pyenv.git /pyenv
RUN eval "$(/pyenv/bin/pyenv init -)" && pyenv install 3.10
# install poetry - respects $POETRY_VERSION & $POETRY_HOME
RUN eval "$(/pyenv/bin/pyenv init -)" && pip install poetry

# clone zmk
RUN git clone --filter=tree:0 --single-branch --branch=${ZMK_BRANCH} ${ZMK_URL} ${ZMK_PATH}

# build zmk
RUN cd ${ZMK_PATH} && \
    west init -l app/ && \
    west update && \
    cd /

WORKDIR ${WORKPACE_PATH}
