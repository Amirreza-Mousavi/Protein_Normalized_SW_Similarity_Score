###Bleakly-Yamanishi Normalized Smith-Waterman Similarity Score
###By SeyyedAmirreza Mousavi Majd

###Initilization

library(Biostrings)
library(here)

options(max.print=3000)

graphics.off()
par(mar=c(1,1,1,1)) #To avoid "Error in plot.new() : figure margins too large"

data("BLOSUM62")
setwd(here())

###Adjust Working Directory manually in case of error.
###setwd("C:/Users/Amirreza/Desktop/")

###Definition of Bleakly-Yamanishi Normalized Smith-Waterman Similarity Score function

BY.Norm.SW.SS = function(AAstring1,AAstring2){
  
  SW12=pairwiseAlignment(pattern = AAstring1,
                         subject = AAstring2,
                         type="local",
                         substitutionMatrix=BLOSUM62,
                         gapOpening=10,
                         gapExtension=0.5,
                         scoreOnly=TRUE)
  
  SW11=pairwiseAlignment(pattern = AAstring1,
                         subject = AAstring1,
                         type="local",
                         substitutionMatrix=BLOSUM62,
                         gapOpening=10,
                         gapExtension=0.5,
                         scoreOnly=TRUE)
  
  SW22=pairwiseAlignment(pattern = AAstring2,
                         subject = AAstring2,
                         type="local",
                         substitutionMatrix=BLOSUM62,
                         gapOpening=10,
                         gapExtension=0.5,
                         scoreOnly=TRUE)
  
  return(SW12/(sqrt(SW11)*sqrt(SW22)))
  
}

###Import your fasta files here
myseq=readAAStringSet("Uniprot_GPCR_Human_Reviewed_Canocial_and_Isoform.txt")

N=length(myseq)

###Set N to 10 or 20 to see a demo if you have more than 100 sequences.
### N=10

###Generate the protein similarity matrix :
###res matrix must be symmetric. A computational advantage!
###BY.Norm.SW.SS for a pair of identical proteins is 1. A computational advantage!

res=matrix(data = 1,nrow = N,ncol=N)
p=0 #counter for the loop

for(j in 1:(N-1)){
  for(i in (j+1):N){
s1=myseq[[i]]
s2=myseq[[j]]
res[i,j]=BY.Norm.SW.SS(s1,s2)
res[j,i]=res[i,j] 
p=p+1
cat((p*100)/(N*(N-1)*0.5),"% done! \n") ###TOTAL NUMBER OF THE LOOPS: N*(N-1)/2
  }
}

###Adjust column names and row names for better demonstration.
###My source for sequences was uniprot. This piece of code might not work if fasta files are taken from somewhere else.
pro_names=names(myseq)
id_hits=gregexpr2(pattern = "|",text = pro_names)
l=list()

for(i in 1:N){
  if(length(id_hits[[i]]) !=2){print("Some serious error happened at extracting sequence names from the original file.")}
  l=c(l,substr(pro_names[i],start = id_hits[[i]][1]+1,stop = id_hits[[i]][2]-1))
}
res=as.data.frame(res)
colnames(res)=unlist(l)
rownames(res)=unlist(l)


###print the res data.frame and save it as csv.
print(res)
write.csv(res,"result.txt")

####1/res is a measure of dissimilarity (how to reach dissimilarity from similarity?)

plot(hclust(as.dist(1/res,diag = TRUE,upper = TRUE)))
