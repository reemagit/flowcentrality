#!/usr/bin/env Rscript --vanilla
args = commandArgs(trailingOnly=TRUE)

# test if there is at least one argument: if not, return an error
if (length(args)!=3) {
  stop("Usage: eval_do_sims.R doids_file {Resnik,Wang,Lin} output_sims", call.=FALSE)
}

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
if (!("GO.db" %in% rownames(installed.packages())))
{
  BiocManager::install("GO.db")
}
if (!("DO.db" %in% rownames(installed.packages())))
{
  BiocManager::install("DO.db")
}
if (!("DOSE" %in% rownames(installed.packages())))
{
  BiocManager::install("DOSE")
}

library(DOSE)

#source("https://bioconductor.org/biocLite.R")
#biocLite("DOSE")

doids <- read.table(args[1], stringsAsFactors = FALSE)

sims <- matrix(,nrow(doids),nrow(doids))


start_time <- Sys.time()

for (i in 1:(nrow(doids)))
{
  for (j in i:nrow(doids))
  {
    print(doids[i,1])
    print(doids[j,1])
    print(i)
    print(j)
    print('---')
    if (i == j) { sims[i,j] <- 1 }
    else
    {
      curr_sim <- tryCatch(
        {
          doSim(doids[i,1], doids[j,1], measure=args[2])
        },
        error=function(cond) {
          return(NA)
        })
      sims[i,j] <- curr_sim
      sims[j,i] <- curr_sim
    }
  }
}

rownames(sims) <- doids[,1]
colnames(sims) <- doids[,1]

write.table(x=as.data.frame(sims),file=args[3], sep='\t')

Sys.time() - start_time
