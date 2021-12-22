# Protein_Normalized_SW_Similarity_Score
An R script that calculates a similarity matrix for a list of protein sequences with the aid of Bleakley-Yamanishi Normalized Smith-Waterman Similarity Score.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
## Installation
Make sure to have installed the folowing packages : [Biostrings,](https://bioconductor.org/packages/release/bioc/html/Biostrings.html) and [here.](https://here.r-lib.org/)

```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("Biostrings")
```

```
install.packages("here")
```

--------------------------------------------------------------------------------------------------------------------------------------------------------------
## More Details
In the area of Drug-Target Interaction(DTI) prediction and Computer-Aided Drug Design(CADD), most of the times, it is necessary to express the proteins and the drugs as a series of features and attributes that help us train our prediction model more efficiently. Bleakley-Yamanishi Normalized Smith-Waterman Similarity Score is one of the ways to rate and cluster a pair of proteins based on the similarity of their sequences.
The classic Smith-Waterman Similarity Score is higher for larger sequences and lower for small sequences. The normalization process, helps to neutralize the influence of the length of the pairs of the sequence on the similarity score, hence the name normalzied similarity score.

Bleakley-Yamanishi Normalized Smith-Waterman Similarity Score was first described in [this paper.](https://academic.oup.com/bioinformatics/article/25/18/2397/197654?login=true) and was subsequently used by other researchers in this field(see [this paper.](https://jcheminf.biomedcentral.com/articles/10.1186/s13321-015-0089-z)).




Further Readings :

>Kevin Bleakley, Yoshihiro Yamanishi, Supervised prediction of drug–target interactions using bipartite local models, Bioinformatics, Volume 25, Issue 18, 15 September 2009, Pages 2397–2403, https://doi.org/10.1093/bioinformatics/btp433
>Seal, A., Ahn, YY. & Wild, D.J. Optimizing drug–target interaction prediction based on random walk on heterogeneous networks. J Cheminform 7, 40 (2015). https://doi.org/10.1186/s13321-015-0089-z

----------------------------------------------------------------------------------------------------------------------------------------------------------------
**NOTE:** As always, I have put the Expected_Results folder which contains the files that the R script generates once you run it.

**NOTE:** ~~Make sure to edit setwd command in the R script to point at your desired directory.~~ In this particular repository, it is not necessary because of the *here* package. However you can consider to do it manually in case the script somehow does not work for you.
