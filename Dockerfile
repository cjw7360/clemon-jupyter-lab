FROM jupyter/minimal-notebook

# COPY --chown=1000:1000 .condarc /home/jovyan/
# conda clean -i
RUN conda install --quiet --yes --freeze-installed -c conda-forge \
    'nodejs' \
    'python-language-server' \
    'jupyterlab=2.2.9' \
    'texlab' \
    'chktex' \
    'jupyter-lsp' \
    'jupyterlab_code_formatter' \
    'jupyterlab-git' \
    'numpy' \
    'scipy' \
    'matplotlib==3.3.1' \
    'ipympl==0.5.8' \
    'yarn'
    # && npm config set registry https://registry.npm.taobao.org  \
    # && yarn config set registry https://registry.npm.taobao.org \
    # && yarn config set proxy http://10.1.1.183:7890 && yarn confit set https-proxy http://10.1.1.183:7890 \
RUN jupyter labextension install --no-build \
    '@krassowski/jupyterlab-lsp' \
    '@ryantam626/jupyterlab_code_formatter' \
    '@jupyterlab/git' \
    '@jupyterlab/debugger' \
    'jupyterlab-theme-solarized-dark' \
    'jupyterlab_onedarkpro' \
    'jupyterlab-topbar-extension' \
    'jupyterlab-system-monitor' \
    'jupyterlab-topbar-text' \
    'jupyterlab-logout' \
    'jupyterlab-theme-toggle' \
    '@deathbeds/jupyterlab-fonts' \
    '@deathbeds/jupyterlab-font-dejavu-sans-mono' \
    '@jupyter-widgets/jupyterlab-manager' \
    'jupyter-matplotlib@0.7.4' \
    && jupyter lab build --dev-build=False --minimize=True \
    && conda clean --all -f -y \
    && rm -rf \
    $CONDA_DIR/share/jupyter/lab/staging \
    /home/$NB_USER/.cache/yarn \
    && fix-permissions $CONDA_DIR \
    && fix-permissions /home/$NB_USER \
    && jupyter serverextension enable --py jupyterlab_code_formatter 
    # && jupyter nbextension enable --py widgetsnbextension

VOLUME [ "/home/jovyan/work/" ]