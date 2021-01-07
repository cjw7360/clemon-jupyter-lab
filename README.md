# Jupyter Lab Personal Version

## Release
1. jupyter lab version 2.2.9

## Build Tips:
* In china, build should do under global proxy. (Don't know why Taobao(Or other) source of `yarn` do not work for `jupyter lab build` cmd)
* In version 2.x of jupyter lab, matplotlib、ipympl and jupyter-matplotlib must use special version. (Ver 3.x of jupyter lab has shiped with matplotlib, but this version has not official docker image)
* Conda source of Tsinghua University is also work instability. BFSU source work well.