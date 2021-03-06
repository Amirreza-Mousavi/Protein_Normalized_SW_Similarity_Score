# Protein_Normalized_SW_Similarity_Score
An R script that calculates a similarity matrix for a list of protein sequences with the aid of **Bleakley-Yamanishi Normalized Smith-Waterman Similarity Score.**

-------------------------------------------------------------------------------------------------------------------------------------------------------------
## Installation
Make sure to have installed the following packages : [Biostrings,](https://bioconductor.org/packages/release/bioc/html/Biostrings.html) and [here.](https://here.r-lib.org/)

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
In the area of Drug-Target Interaction *(DTI)* prediction and Computer-Aided Drug Design *(CADD)* , most of the times, it is necessary to express the proteins and the drugs as a series of features and attributes that help us train our prediction model more efficiently. **Bleakley-Yamanishi Normalized Smith-Waterman Similarity Score** is one of the ways to rate and cluster a pair of proteins based on the similarity of their sequences.
The *classic* **Smith-Waterman Similarity Score** is higher for larger sequences and lower for small sequences. The normalization process, helps to neutralize the influence of the length of the pairs of the sequence on the similarity score, hence the name normalized similarity score.

**Bleakley-Yamanishi Normalized Smith-Waterman Similarity Score** was first described in [this paper.](https://academic.oup.com/bioinformatics/article/25/18/2397/197654?login=true) and was subsequently used by other researchers in this field(see [this paper.](https://jcheminf.biomedcentral.com/articles/10.1186/s13321-015-0089-z)).

The settings for the pairwise alignment are similar to the default paramters of [EMBOSS Water PSA](https://www.ebi.ac.uk/Tools/psa/emboss_water/) program hosted at **European Bioinformatic Institute(EBI)** website :

>Substitution Matrix = BLOSUM62, Gap open = 10, Gap extend = 0.5

This particular formula taken from Bleakley et al (2009), is the heart of this script :

![Image](https://oup.silverchair-cdn.com/oup/backfile/Content_public/Journal/bioinformatics/25/18/10.1093_bioinformatics_btp433/2/m_btp433i1.gif?Expires=1642746379&Signature=GBLKbo5e6hgLU7cZzKh15lqDSz-P3A~0Xi1BPxEwqQ9FSl1tHOa-DTE5~X5Biq18hL6qQcfMWpR20EboQ8O6B2XO1V1Yrk-rnpkWwpToHtEDsl9~-L1lOVtKU9TNGG5jetBsz81kOJu01oLbEmq~omId9I9n4K1xyOzESDpKRfLTCjMtwXMcJ9CrjElPQn4plaCUn8Nk1r-Osdjw51zZtiBxzOu8VUQzjI9JHLUW9OCQ1CNu0PzYjDfH-PufgJBdetJSyh4dncTxn21qwBDC6Iyu3QPBrkcows-FOZswJ7Ohh3~LZaS9lwfXXSzEpzYXBvGrazXnR~AgpjBWQbqO2w__&Key-Pair-Id=APKAIE5G5CRDK6RD3PGA) 


**Further Readings :**

>Kevin Bleakley, Yoshihiro Yamanishi, Supervised prediction of drug???target interactions using bipartite local models, Bioinformatics, Volume 25, Issue 18, 15 September 2009, Pages 2397???2403, https://doi.org/10.1093/bioinformatics/btp433

>Seal, A., Ahn, YY. & Wild, D.J. Optimizing drug???target interaction prediction based on random walk on heterogeneous networks. J Cheminform 7, 40 (2015). https://doi.org/10.1186/s13321-015-0089-z

>Maryam Bagherian, Elyas Sabeti, Kai Wang, Maureen A Sartor, Zaneta Nikolovska-Coleska, Kayvan Najarian, Machine learning approaches and databases for prediction of drug???target interaction: a survey paper, Briefings in Bioinformatics, Volume 22, Issue 1, January 2021, Pages 247???269, https://doi.org/10.1093/bib/bbz157

----------------------------------------------------------------------------------------------------------------------------------------------------------------

- The script takes about *a minute or so* provided that the number of sequences are below 50. For fasta files which contain 1000 unique sequences and more, it takes around *24 hours* for the tasks to complete! 
- For larger sequences, one might use parallelization. I have to use `parallel` package of R, if I want to implement parallelization in the future.
- I have provided five datasets, containing the sequences of various proteins of human proteome. All of these five files are taken from Uniprotkb. *"16_Selected_Proteins.txt"* and *"38_Selected_Proteins.txt"* can be used as demo datasets to test the script. The other three datasets, contain much more sequences and it takes more than a day for my system to execute them. Parallelization might be helpful to reduce the needed time.
- I first calculated the similarity matrix, then used (res)^(-1) as a measure of dissimilarity. There must exist a better way to calculate dissimilarity scores from similarity scores...

**NOTE:** As always, I have put the Expected_Results folder which contains the files that the R script generates once you run it.

**NOTE:** ~~Make sure to edit setwd command in the R script to point at your desired directory.~~ In this particular repository, it is not necessary because of the *here* package. However you can consider to do it manually in case the script somehow does not work for you.
