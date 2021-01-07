FROM jupyter/minimal-notebook

COPY .condarc /home/jovyan/.condarc.bfsu

RUN conda install --quiet --yes --freeze-installed -c conda-forge \
    'nodejs' \
    'python-language-server=0.36.2' \
    'jupyterlab=3.0.1' \
    'texlab' \
    'chktex' \
    'jupyter-lsp=1.0.0' \
    'jupyterlab_code_formatter=1.3.8' \
    'numpy' \
    'scipy' \
    'matplotlib' \
    'ipympl' \
    'yarn'

RUN jupyter labextension update -y --all --no-build

RUN jupyter labextension install --no-build \
    '@krassowski/jupyterlab-lsp@3.0.0' \
    '@ryantam626/jupyterlab_code_formatter@1.3.8' \
    # 'jupyterlab-execute-time' \ 
    && jupyter labextension install --no-build \
    'jupyterlab-theme-solarized-dark' \
    # 'jupyterlab-system-monitor' \
    # 'jupyterlab-topbar-extension' \
    # 'jupyterlab-topbar-text' \
    # 'jupyterlab-topbar' \
    # 'jupyterlab-logout' \
    # 'jupyterlab-theme-toggle' \
    # '@deathbeds/jupyterlab-fonts' \
    # '@deathbeds/jupyterlab-font-dejavu-sans-mono' \
    # '@deathbeds/jupyterlab-font-fira-code' \
    && jupyter lab build --dev-build=False --minimize=True \
    && jupyter server extension enable --py jupyterlab_code_formatter \
    && jupyter nbextension enable --py widgetsnbextension \
    && conda clean --all -f -y \
    && rm -rf \
    $CONDA_DIR/share/jupyter/lab/staging \
    /home/$NB_USER/.cache/yarn \
    && fix-permissions $CONDA_DIR \
    && fix-permissions /home/$NB_USER

VOLUME [ "/home/jovyan/work/" ]