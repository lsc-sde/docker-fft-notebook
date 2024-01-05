# Custom data science notebook for FFT project
ARG OWNER=vvcb
ARG BASE_CONTAINER=jupyter/datascience-notebook:python-3.8.8
FROM $BASE_CONTAINER

LABEL maintainer="vvcb"

RUN mamba install --quiet --yes \
    'black' \
    'isort' \
    'jupyterlab_code_formatter' \
    'holoviews'  \
    'fastapi' \
    'uvicorn[standard]' \
    'scikit-learn=0.22.1' \
    'nltk=3.6.3'
RUN mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
COPY jupyter_notebook_config.json /etc/jupyter/jupyter_notebook_config.json
USER ${NB_USER}