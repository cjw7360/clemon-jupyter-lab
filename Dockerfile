FROM jupyter/minimal-notebook

RUN conda config --set show_channel_urls yes

COPY --chown=1000:1000 .condarc /home/jovyan/

RUN cat $HOME/.condarc && conda clean -i \
    && conda install --quiet --yes --freeze-installed -c conda-forge \
    'nodejs' \
    'python-language-server' \
    'jupyterlab=2.2.9' \
    'texlab' \
    'chktex' \
    'jupyter-lsp' \
    'jupyterlab_code_formatter' \
    'jupyterlab-git' \
    && jupyter labextension install --no-build \
    '@krassowski/jupyterlab-lsp' \
    '@ryantam626/jupyterlab_code_formatter' \
    '@jupyterlab/git' \
    '@jupyterlab/debugger' \
    '@jupyterlab/toc-extension' \
    'jupyterlab-theme-solarized-dark' \
    'jupyterlab_onedarkpro' \
    'jupyterlab-topbar-extension' \
    'jupyterlab-system-monitor' \
    'jupyterlab-topbar-text' \
    'jupyterlab-logout' \
    'jupyterlab-theme-toggle' \
    && jupyter lab build --dev-build=False --minimize=True \
    && conda clean --all -f -y \
    && rm -rf \
    $CONDA_DIR/share/jupyter/lab/staging \
    /home/$NB_USER/.cache/yarn \
    && fix-permissions $CONDA_DIR \
    && fix-permissions /home/$NB_USER \
    && jupyter serverextension enable --py jupyterlab_code_formatter