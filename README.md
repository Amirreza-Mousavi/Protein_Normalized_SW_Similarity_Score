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









**NOTE:** As always, I have put the Expected_Results folder which contains the files that the R script generates once you run it.

**NOTE:** ~~Make sure to edit setwd command in the R script to point at your desired directory.~~ In this particular repository, it is not necessary because of the *here* package. However you can consider to do it manually in case the script somehow does not work for you.
