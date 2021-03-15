FROM jupyter/scipy-notebook:latest

COPY .condarc /home/jovyan/.condarc

RUN conda clean -i && conda install --quiet --yes --freeze-installed -c conda-forge \
    'python-language-server' \
    'jupyter-lsp'

RUN jupyter labextension install --no-build \
    # '@jupyterlab/hdf5' \
    '@krassowski/jupyterlab-lsp' \
    && jupyter lab build --dev-build=False --minimize=True \
    # && jupyter server extension enable --py jupyterlab_code_formatter \
    # && jupyter nbextension enable --py widgetsnbextension \
    && conda clean --all -f -y \
    && rm -rf \
    $CONDA_DIR/share/jupyter/lab/staging \
    /home/$NB_USER/.cache/yarn \
    && fix-permissions $CONDA_DIR \
    && fix-permissions /home/$NB_USER

VOLUME [ "/home/jovyan/work/" ]