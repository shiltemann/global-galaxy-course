library(ggplot2)
library(scales)
library(plyr)
library(dplyr)


files = list.files(path="messages", pattern="*.tsv", full.names = TRUE)
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



base = ggplot(freqs) + geom_bar(stat="identity", colour="black", aes(x=Group.1, y=x, fill=Group.2)) + theme_minimal()+ labs(title="Slack Conversations", x= "Day", y="Messages", fill="Channels")
p = base + scale_x_date(labels=date_format("%B %d"), limits = as.Date(c('2021-02-14','2021-03-08')))
ggsave("messages-all.png", width=10, height=5, dpi=400)
p = base + scale_x_date(labels=date_format("%B %d"), limits = as.Date(c('2021-02-14','2021-02-20')))
ggsave("messages-during.png", width=10, height=5, dpi=400)

unique_users_per_channel = 
  df %>%
  group_by(channel) %>%
  mutate(unique_types = n_distinct(user)) %>%
  select(channel, unique_types, cpre2) %>%
  summarize(count = n())

# ggplot(unique_users_per_channel) + geom_bar(stat="identity", colour="black", aes(x=channel, y=x)) + theme_minimal()

x = df %>% select(day, user) %>% distinct() %>% select(day) %>% group_by(day) %>% summarize(n=n())

p = ggplot(x) + geom_bar(stat="identity", colour="black", aes(x=day, y=n)) + theme_minimal()+ labs(title="Unique Users Conversing on Slack", x= "Day", y="Users")
ggsave("unique-users-messaging.png", width=10, height=5, dpi=400)
