load(file='/home/projects/22140/exam_data/exam_functions.Rdata')

#load dataset GSE173955
study_1 <- "GSE173955"
study_2 <- "GSE67333"

GSE173955_isoform <- loadIsoformCountMatrix(study_1)
GSE173955_transcript <- extractGeneCountMatrixFromIsoCounts(GSE173955_isoform)

GSE67333_isoform <- loadIsoformCountMatrix(study_2)
GSE67333_transcript <- extractGeneCountMatrixFromIsoCounts(GSE67333_isoform)

#meta data
GSE173955_metadata <- read_csv("/home/projects/exam_2025_22140_22150/group_2/data/GSE173955_metadata.csv")
GSE67333_metadata <- read_csv("/home/projects/exam_2025_22140_22150/group_2/data/GSE67333_metadata.csv")

save(GSE173955_isoform,GSE173955_transcript,GSE173955_metadata,GSE67333_isoform,GSE67333_transcript,GSE67333_metadata, file = "/home/projects/exam_2025_22140_22150/group_2/data/hippocampus_data.Rdata")