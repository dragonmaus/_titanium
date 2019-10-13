sed 's/$/.remote/' < remote.list | tr '\n' '\0' | xargs -0 redo-ifchange remote.list
