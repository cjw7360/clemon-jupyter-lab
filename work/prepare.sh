#!/bin/bash

set -e
conda clean -i && conda install --quiet --yes --freeze-installed -c conda-forge \
    'python-language-server' \
    'jupyter-lsp'

jupyter labextension install --no-build \
    '@krassowski/jupyterlab-lsp'

jupyter lab build --dev-build=False --minimize=True

