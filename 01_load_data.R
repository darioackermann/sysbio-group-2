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

# load additional datasets
additional_studies <- c("GSE95587","GSE228458,GSE228459")
data_objects <- c("additional_studies") 

for (study in additional_studies){
  iso <- loadIsoformCountMatrix(study)
  DE <- extractGeneCountMatrixFromIsoCounts(iso)
  meta <- read_csv(paste0("/home/projects/exam_2025_22140_22150/group_2/data/",study,"_metadata.csv"))
  
  assign(paste0(study,"_isoform"),iso)
  assign(paste0(study,"_transcript"),DE)
  assign(paste0(study,"_metadata"),meta)
  
  data_objects <- append(data_objects,c(paste0(study,"_isoform"),
                                        paste0(study,"_transcript"),
                                        paste0(study,"_metadata")))
  
}

save(list = data_objects, file = "/home/projects/exam_2025_22140_22150/group_2/data/additional_data.Rdata")

