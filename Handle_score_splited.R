
data <- read.table("Score_A37_tobeextract_GPT4.csv", sep = "|", header = FALSE, quote = "", fill = TRUE)

colnames(data) <- c("Gene symbol", "Gene Name", "Function", "Comment_Ery", "References_Ery", "Score_Ery",
                    "Comment_Clin BM", "References_Clin BM", "Score_Clin BM",
                    "Comment_BT BM", "References_BT BM", "Score_BT BM",
                    "Comment_Immuno", "References_Immuno", "Score_Immuno",
                    "Comment_drug target", "References_drug target", "Score_drug target",
                    "Comment_therapeutic", "References_therapeutic", "Score_therapeutic")

data= data[-1,]
data= as.data.frame(data)
data$Genes = sapply(strsplit(data[,1],","),"[",3)
data$Module = sapply(strsplit(data[,1],","),"[",2)
colnames(data)=paste(colnames(data),"GPT4",sep = " ")
dataGPT4=data
write.csv(data, file = "Score_A37_GPT4.csv", row.names = FALSE)



data <- read.table("Score_A37_tobeextract_CLAUDE.csv", sep = "|", header = FALSE, quote = "", fill = TRUE)

colnames(data) <- c("Gene symbol", "Gene Name", "Function", "Comment_Ery", "References_Ery", "Score_Ery",
                    "Comment_Clin BM", "References_Clin BM", "Score_Clin BM",
                    "Comment_BT BM", "References_BT BM", "Score_BT BM",
                    "Comment_Immuno", "References_Immuno", "Score_Immuno",
                    "Comment_drug target", "References_drug target", "Score_drug target",
                    "Comment_therapeutic", "References_therapeutic", "Score_therapeutic")

data= data[-1,]
data= as.data.frame(data)
data$Genes = sapply(strsplit(data[,1],","),"[",3)
data$Module = sapply(strsplit(data[,1],","),"[",2)
colnames(data)=paste(colnames(data),"CLAUDE",sep = " ")
dataCLAUDE=data
write.csv(data, file = "Score_A37_CLAUDE.csv", row.names = FALSE)


data <- read.table("M15.74_CLAUDE.txt", sep = "|", header = FALSE, quote = "", fill = TRUE)

colnames(data) <- c("Gene symbol", "Gene Name", "Function", "Comment_Ery", "References_Ery", "Score_Ery",
                    "Comment_Clin BM", "References_Clin BM", "Score_Clin BM",
                    "Comment_BT BM", "References_BT BM", "Score_BT BM",
                    "Comment_Immuno", "References_Immuno", "Score_Immuno",
                    "Comment_drug target", "References_drug target", "Score_drug target",
                    "Comment_therapeutic", "References_therapeutic", "Score_therapeutic")

data= data[-1,]
data= as.data.frame(data)
data$Genes = sapply(strsplit(data[,1],","),"[",3)
data$Module = sapply(strsplit(data[,1],","),"[",2)
colnames(data)=paste(colnames(data),"CLAUDE",sep = " ")
dataCLAUDE_M15.74 =data
write.csv(data, file = "Score_M15.74_CLAUDE.csv", row.names = FALSE)


data <- read.table("M15.74_GPT4.txt", sep = "|", header = FALSE, quote = "", fill = TRUE)

colnames(data) <- c("Gene symbol", "Gene Name", "Function", "Comment_Ery", "References_Ery", "Score_Ery",
                    "Comment_Clin BM", "References_Clin BM", "Score_Clin BM",
                    "Comment_BT BM", "References_BT BM", "Score_BT BM",
                    "Comment_Immuno", "References_Immuno", "Score_Immuno",
                    "Comment_drug target", "References_drug target", "Score_drug target",
                    "Comment_therapeutic", "References_therapeutic", "Score_therapeutic")

data= data[-1,]
data= as.data.frame(data)
data$Genes = sapply(strsplit(data[,1],","),"[",3)
data$Module = sapply(strsplit(data[,1],","),"[",2)
colnames(data)=paste(colnames(data),"GPT4",sep = " ")
dataM1574_GPT4=data
write.csv(data, file = "Score_M15.74_GPT4.csv", row.names = FALSE)

dataGPT4= read.csv(file = "./Score_A37_GPT4.csv",stringsAsFactors = F)
colnames(dataGPT4)=gsub(colnames(dataGPT4),pattern = "\\.",replacement = " ")

dataGPT4_sel = dataGPT4[grep(colnames(dataGPT4),pattern = "Module|Genes|Score")]
dataGPT4_sel$Gene= paste(dataGPT4_sel$`Module GPT4`,dataGPT4_sel$`Genes GPT4`,sep="_")
dataCLAUDE_sel=dataCLAUDE[grep(colnames(dataCLAUDE),pattern = "Module|Genes|Score")]
dataCLAUDE_sel$Gene =paste(dataCLAUDE_sel$`Module CLAUDE`,dataCLAUDE_sel$`Genes CLAUDE`,sep="_")


data_merge = merge(dataGPT4_sel,dataCLAUDE_sel,by="Gene",all=F)

data_merge=unique(data_merge)
data_merge=data_merge[,-c(16:17)]
data_merge$`Score_therapeutic CLAUDE` = gsub(data_merge$`Score_therapeutic CLAUDE`,pattern = " 2\"",replacement = " 2 ")
data_merge$`Score_therapeutic CLAUDE` = as.numeric(data_merge$`Score_therapeutic CLAUDE`)
data_merge = data_merge[,c("Gene", "Module GPT4" , "Genes GPT4",
                         "Score_Ery GPT4" ,"Score_Ery CLAUDE",
                         "Score_Clin BM GPT4","Score_Clin BM CLAUDE",
                         "Score_BT BM GPT4" ,"Score_BT BM CLAUDE",
                         "Score_Immuno GPT4","Score_Immuno CLAUDE",
                         "Score_drug target GPT4","Score_drug target CLAUDE",
                         "Score_therapeutic GPT4","Score_therapeutic CLAUDE")]

data_merge$Avg_Ery = rowMeans(data_merge[,c("Score_Ery GPT4" ,"Score_Ery CLAUDE")])
data_merge$Avg_Clin.BM = rowMeans(data_merge[,c("Score_Clin BM GPT4","Score_Clin BM CLAUDE")])
data_merge$Avg_BT.BM = rowMeans(data_merge[,c("Score_BT BM GPT4" ,"Score_BT BM CLAUDE")])
data_merge$Avg_Immuno= rowMeans(data_merge[,c("Score_Immuno GPT4","Score_Immuno CLAUDE")])
data_merge$Avg_drug.target = rowMeans(data_merge[,c("Score_drug target GPT4","Score_drug target CLAUDE")])
data_merge$Avg_therapeutic = rowMeans(data_merge[,c("Score_therapeutic GPT4","Score_therapeutic CLAUDE")])
data_merge$SUM.of.Scores =rowSums(data_merge[,c("Avg_Ery","Avg_Clin.BM","Avg_BT.BM","Avg_Immuno","Avg_drug.target","Avg_therapeutic")])
colnames(data_merge)= gsub(colnames(data_merge),pattern = "\\.",replacement = " ")
write.csv(data_merge,file = "./Score_merge_A37_V2.csv")








