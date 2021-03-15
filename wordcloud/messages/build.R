library(ggplot2)
require(plyr)

files = list.files(pattern="*.tsv")
head(files)
data_list = lapply(files, read.table, header = TRUE, sep='\t')
df <- do.call(rbind, data_list)
df$date = as.POSIXct(as.numeric(as.character(df$ts)), origin="1970-01-01", tz="UTC")
df$day = as.Date(df$date, format="%Y-%m-%d")
df$cpre =  substr(df$channel, 0, 1)
df$cpre2 = mapvalues(df$cpre,
                     from=c("1", "2", "3", "4", "5", "a", "f", "g", "r", "s"),
                     to=c("Day 1 (Intro)", "Day 2 (RNASeq)", "Day 3 (ScRNA)", "Day 4 (Proteomics)", "Day 5 (CYOA)", "Announcements", "Feedback", "General", "Random", "Social"))
freqs <- aggregate(df$day, by=list(df$day, df$cpre2), FUN=length)

p = ggplot(freqs) + geom_bar(stat="identity", colour="black", aes(x=Group.1, y=x, fill=Group.2)) + theme_minimal()+ labs(title="Slack Conversations", x= "Day", y="Messages", fill="Channels")
ggsave("messages-all.png")
p = p + scale_x_date(labels=date_format("%B %d"), limits = as.Date(c('2021-02-14','2021-02-20')))
ggsave("messages-during.png")
