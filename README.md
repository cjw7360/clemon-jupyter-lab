# Jupyter Lab Personal Version

## Release
1. jupyter lab version 2.2.9
2. jupyter lab version 3.0.1


## How to get a new conda env
```
conda create -n new_env_name python=3.x
conda activate new_env_name
conda install -y -c conda-forge ipykernel ipympl matplotlib
ipython kernel install --user --name new_env_name --display-name "name_to_display"
```

## Unknown
* In default conda base env, `%matplotlib widget` is invaild, but a new env works fine for that.

## Build Tips
* In china, build should do under global proxy. (Don't know why Taobao(Or other) source of `yarn` do not work for `jupyter lab build` cmd)
* In version 2.x of jupyter lab, matplotlib、ipympl and jupyter-matplotlib must use special version. (Ver 3.x of jupyter lab has shiped with matplotlib, but this version has not official docker image)
* Conda source of Tsinghua University is also work instability. BFSU source work well.