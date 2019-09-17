# renseq
Renseq Pacbio pipeline

![Docker infoimage badge](https://img.shields.io/badge/ImageInfo-_5.584_GB/_25_Layers_-blue.svg?style=flat-square)

Apologies for the size of this image, but it installs the entire PACBio SMRT-Analysis suite which is quite big. And apparently, to run the CLI `smrtpipe.py`, [the whole suite *must* be installed](https://github.com/PacificBiosciences/SMRT-Analysis/issues/256), including a mysqldb and a full web stack for a web GUI that is never used (read). Anyway, most of the bulk seem to be folders mysteriously named "parameters" with a date. Gigs worth of parameters, why not?

Combining this docker image with the entrypoint from the following [gist](https://gist.github.com/audy/26748bdf6f5e260dd6f6), one can run the fully functional web-interface of the PacBio assembly pipeline.

## Usage

1. `renseq` pipeline:

put your files in a folder that will be mounted in the image as a volume e.g. `data`. Then:

`docker run -ti -v data:/home/admin/data cyverseuk/renseq /home/admin/data/adapter.fasta /home/admin/data/file1.h5 /home/admin/data/file2.h5 etc...`

2. web-interface for PacBio assembly pipeline:

run this docker exposing port, mounting volumes and providing alternative entrypoint:
`docker run -dit  --entrypoint ./scripts/runWeb.sh --expose 8080 -p 8080:8080 --volume /data:/data --name pacbio-container pacbio`
semantics:

3. general docker tips:
 - building this image: `docker build -t pacbio .`
 - ports and volumes mapping semantics: `--port outside_port:inside_port --volume outside_path:inside_path`
 - to access running web-interface in the browser go to: `0.0.0.0:outside_port` or `your_hostname:outside_port`
