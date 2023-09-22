
data <- read.table("2023 Jul3 M11p2.txt", sep = "|", header = FALSE, quote = "", fill = TRUE)
colnames(data) <- c("Gene symbol", "Gene Name", "Function", "Comment_Ery", "References_Ery", "Score_Ery",
                    "Comment_Clin BM", "References_Clin BM", "Score_Clin BM",
                    "Comment_BT BM", "References_BT BM", "Score_BT BM",
                    "Comment_Immuno", "References_Immuno", "Score_Immuno",
                    "Comment_drug target", "References_drug target", "Score_drug target",
                    "Comment_therapeutic", "References_therapeutic", "Score_therapeutic")
write.csv(data, file = "OUT_2023 Jul3 M11p2.csv", row.names = FALSE)
