# Chapter 2

# wins and losses
year<- 1946 : 1952
w <- c(8, 21, 15, 21, 21, 22, 14)
l <- c(5, 10, 12, 14, 17, 14, 19)

# winning percentage
win_pct <- 100 * w / (w + l)                    # yearly
mean(win_pct)                                   # yearly average
wtd_win_pct <- 100 * sum(w)/(sum(w) + sum(l))   # weighted average

# summary
table(w)             # single variable
table(w,l)           # two variables
table(w,l,win_pct)   # multiple variables

# age
age <- year - 1921

# graphs
plot(age, win_pct)

# useful functions
sort(w)     # sort
cumsum(w)   # cumulative sum
summary(win_pct)

# vector indices and logical functions
w[c(1,2,5)]                     # select specific members of array
w[1:4]                          # select series from array
w[-c(1,6)]                      # remove specific members from array
win_pct > 60                    # select by value
(w > 20) & (win_pct > 60)       # multiple conditions
win_pct == max(win_pct)         # identify max value in vector
year[win_pct == max(win_pct)]   # return value instead of True / False
year[w + l > 30]

# character data and matrices
nl <- c("FLA", "STL", "HOU", "STL", "COL", "PHI", "PHI", "SFG", "STL", "SFG")
al <- c("NYY", "BOS", "CHW", "DET", "BOS", "TBR", "NYY", "TEX", "TEX", "DET")
winner <- c("NL", "AL", "AL", "NL", "NL", "NL", "AL", "NL", "NL", "NL")
n_games <- c(6, 4, 4, 5, 4, 5, 6, 5, 7, 4)
year <- 2003:2012
results <- matrix(c(nl, al), 10, 2)  # create matrix from vectors
results

dimnames(results)[[1]] <- year
dimnames(results)[[2]] <- c("NL Team", "AL Team")  # add labels
results

table(winner)  # summary table
barplot(table(winner))
by(n_games, winner, summary)

# Need to source "baseball functions.R" to run the following
hr <- c(13, 23, 21, 27, 37, 52, 34, 42, 31, 40, 54)
ab <- c(341, 549, 461, 543, 517, 533, 474, 519, 541, 527, 514)
age <- 19:29
hr_rate <- hr_rates(age, hr, ab)
mantle <- cbind(age, hr, ab, rates = hr_rate$y)
plot(hr_rates(age, hr, ab))

# Get Spahn data from Git Hub before proceeding
spahn[1:3, 1:10]
spahn[1,]
spahn[1:10, c("Age", "W", "L", "GS", "CG", "SHO", "IP", "ERA")]
summary(spahn$ERA)
plot(spahn$ERA)
spahn$Age[spahn$ERA == min(spahn$ERA)] #get age when ERA reached minimum.
spahn$FIP <- with(spahn, (13 * HR + 3 * BB - 2 * SO) / IP)
pos <- order(spahn$FIP)
head(spahn[pos, c("Year", "Age", "W", "L", "ERA", "FIP")])
