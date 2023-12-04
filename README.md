# Docker SHAPEIT5
#### Authored By: Kyle Scott [kms309@miami.edu](mailto:kms309@miami.edu) & Sven-Thorsten Dietrich [sxd1425@miami.edu](mailto:sxd1425@miami.edu)

This code is made available under the GPL-2.0 license. Please see the LICENSE file for details.

### Source

This Repository contains the files needed to build Docker Images from the SHAPEIT5 source :
Hofmeister RJ, Ribeiro DM, Rubinacci S., Delaneau O. [Accurate rare variant phasing of whole-genome and whole-exome sequencing data in the UK Biobank](https://www.nature.com/articles/s41588-023-01415-w). Nature Genetics

[GitHub](https://github.com/odelaneau/shapeit5)

### Building

To build the images in this repository : `make docker`

To test the images once built : `make docker_test`

### Binaries

1. ligate
2. phase_common
3. phase_rare
4. switch

Each image is packaged with the proper entrypoint & will run with the following command :
`docker run -it hihg-um/${binary}:${tag}`
