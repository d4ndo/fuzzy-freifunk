#!/usr/bin/env Rscript

if (!require("pacman")) install.packages("pacman"); library(pacman)
p_load(jsonlite, RecordLinkage)

fugrep = function(string, stringVector){
  distance = levenshteinSim(string, stringVector);
  #stringVector[distance == max(distance)]
  #which(distance == max(distance))
  order(distance)
}

args = commandArgs()
node <- args[6]
community <- args[7]
num <- args[8]
num <- as.numeric(num)
if (is.na(num)) num <- 1 

#j <- fromJSON("freifunk-karte-data.json")
j <- fromJSON("http://api.freifunk.net/data/freifunk-karte-data.json")
router <- j$allTheRouters
nodesearch <- function(node, coty="all") {
  if (missing(node)) stop()
  as.character(node)
  as.character(coty)
  
  if (is.na(coty) || coty == "all") {
    s <- router
  } else {
    s <- subset(router, community==coty)
  }
  tail(s[fugrep(node, s$name),], n=num)
}

postit <- function(n)
{
  #cat(paste(as.character(n[-8]), collapse="  "), "\n")
  write(paste(as.character(n[-8]), collapse="  "), file="/home/daniel/ircbot/irc.freenode.net/#d4ndo/in")
  write(paste(as.character(n[-8]), collapse="  "), file="/home/daniel/ircbot/irc.hackint.net/#ffmwu/in")

}

res <- nodesearch(node, community)
apply(res, 1, postit)
