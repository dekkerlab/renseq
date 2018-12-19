# pacbio assembly

We are stealing this to combine with this [gist](https://gist.github.com/audy/26748bdf6f5e260dd6f6) to create a usable Pacbio assembly pipeline with their web-interface.

1. build an image:
`docker build -t pacbio .`
2. run it, exposing port and mounting volums:
`docker run -dit -p 8080:8080 --volume /data:/data --name pacbio-container pacbio`
semantics:
`docker run -dit -p outside:inside --volume outside:inside --name pacbio-container pacbio`
3. browse running container if you need to:
`docker exec -it pacbio-container /bin/bash`
4. access it in the browser:
`localhost:8080`, `localhost:${outside}`, `${hostname}:8080` or , `${hostname}:${outside}`, where `${}` are placeholders ment to be replaced with the corresponding values.


# renseq
Renseq Pacbio pipeline

![Docker infoimage badge](https://img.shields.io/badge/ImageInfo-_5.584_GB/_25_Layers_-blue.svg?style=flat-square)

Apologies for the size of this image, but it installs the entire PACBio SMRT-Analysis suite which is quite big. And apparently, to run the CLI `smrtpipe.py`, [the whole suite *must* be installed](https://github.com/PacificBiosciences/SMRT-Analysis/issues/256), including a mysqldb and a full web stack for a web GUI that is never used. Anyway, most of the bulk seem to be folders mysteriously named "parameters" with a date. Gigs worth of parameters, why not?

## Usage
put your files in a folder that will be mounted in the image as a volume e.g. `data`. Then:

`docker run -ti -v data:/home/admin/data cyverseuk/renseq /home/admin/data/adapter.fasta /home/admin/data/file1.h5 /home/admin/data/file2.h5 etc...`
