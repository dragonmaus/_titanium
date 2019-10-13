sed 's/$/.local/' < local.list | tr '\n' '\0' | xargs -0 redo-ifchange local.list
