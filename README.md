

# scMultiSim

**Table of contents**

* [Tutorials and documentation](#tutorials-and-documentation)
* [Installation](#installation)
* [Shiny App](#shiny-app)
* [FAQ](#faq)
* [Contact and reference](#contact)

scMultiSim is an in silico simulator that generates multi-modality data of single-cells, including gene expression, chromatin accessibility, RNA velocity, and spatial location of cells. It takes a cell differential tree and a gene regulatory network (GRN) as input, and simulates spliced and unspliced counts while accounting for the relationships between modalities. The output single cell gene expression data is determined by three factors: cell-cell interactions, within-cell GRNs and chromatin accessibility. Users can tune the effect of each factor on the output data and set various parameters for the underlying model. Furthermore, the GRN can be set in a time-varying mode where the network's structure changes temporally to reflect the dynamic nature of biological networks. We also provide options to simulate technical variations such as batch effects. scMultiSim can be used to benchmark challenging computational tasks on single-cell multi-omics data, including the inference of GRNs, estimation of RNA velocity, integration of single-cell datasets from multiple batches and modalities, and analysis of cell-cell interaction using the cell spatial location data.

![Overview](https://github.com/ZhangLabGT/scMultiSim/raw/img/img/scMultisim.png)

The following figure briefly shows results from the same cell differential tree:

1. Connected scATAC-seq and scRNA-seq, in continuous or discrete mode. Visualized by t-SNE.
2. GRN correlation heatmap, where genes regulated by the same regulator have similar correlations with others.
3. Unspliced counts and RNA velocity ground truth visualized by t-SNE.
4. Spatial cell locations and cell-cell interaction ground truth.
5. Discrete cell population with added batch effects.

![Results](https://github.com/ZhangLabGT/scMultiSim/raw/img/img/results.png)

## Tutorials and documentation

Please check out the [tutorials](https://zhanglabgt.github.io/scMultiSim/articles)
for detailed instructions on how to use scMultiSim.

## Installation

It is recommended to install `scMultiSim` from Bioconductor with:
```R
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("scMultiSim")
```

You can also install the development version of `scMultiSim` from GitHub with:

```R
devtools::install_github("ZhangLabGT/scMultiSim@main")
```

### Difference between the `main` and `bioconductor` branches

Currently, the `main` branch is the development branch and contains the latest features and bug fixes.
The `scMultiSim` package in Bioconductor 3.19 is an older version.
We have updated the package in Bioconductor 3.20, which will be released later.

**After the release of Bioconductor 3.20**,
we will only maintain the Bioconductor version and keep the package in sync with the Bioconductor release.
The `main` branch will be kept only for reproducibility.

## Shiny App

A Shiny app is provided to help users visualize the effect of each parameter and adjust the simulation options.
To run the app, simply call `run_shiny()`.

<img src="https://github.com/ZhangLabGT/scMultiSim/raw/img/img/shiny_app_sc.png" height="400">


## FAQ

### Running Speed

Simulations should finish in a reasonable time in most cases. On a machine with an i7-12700K CPU and 64GB RAM, using 1000 cells, 100 genes and 50 CIFs, the simulation took under 1 mimute to generate both scRNA-seq and scATAC-seq data. If also generating unspliced and spliced counts, or enabling cell-cell interactions, the running time is longer (~3 minutes when RNA velocity is enabled, and 30 minutes for 500 cells with spatial cell-cell interaction enabled).

## Contact and reference

GitHub issues are welcomed.
It is also possible to send email to the main author
`Hechen Li (hli691 at gatech.edu)`.

### Please cite

Hechen Li, Ziqi Zhang, Michael Squires, Xi Chen, and Xiuwei Zhang. 2023. “scMultiSim: Simulation of Multi-Modality Single Cell Data Guided by Cell-Cell Interactions and Gene Regulatory Networks.” bioRxiv.

