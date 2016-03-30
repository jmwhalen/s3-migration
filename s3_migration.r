#get data from files
filedata_mysql <- sapply ("~/mysql.txt", read.table, header=FALSE, fill=FALSE, sep=" ")
filedata_s3 <- sapply ("~/s3.txt", read.table, header=FALSE, fill=FALSE, sep=" ")

# create values
merged_mysql <- rbind(filedata_mysql)
merged_s3 <- rbind(filedata_s3)
values_mysql <- as.numeric(unlist(merged_mysql))
values_s3 <- as.numeric(unlist(merged_s3))

# compare and output
output <- values_mysql[!(values_mysql %in% values_s3)]
write.table(output, file="~/missing-from-s3")

