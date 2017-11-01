#function that takes the tidy data set as input and returns
#a table of all the columns with their class, range, and mean in a .md file
createCB <- function(tidy) {
      df <- data.frame(
            row.names = NULL,
            column.names = names(tidy),
            #gets each variables class type and put into row
            class = sapply(tidy, class),
            #gets each numeric variables range, and all levels for factor class
            range = sapply(tidy, function(x)
                  if (class(x) == "factor")
                        paste(levels(x), collapse = " / ")
                  else if (class(x) == "numeric" ||
                           class(x) == "integer")
                        paste(min(x), max(x), sep = "  /  ")
                  else
                        class(x)),
            #returns the mean of all the mean and std variables within the tidy data set
            mean = sapply(tidy, function(x)
                  if (class(x) == "numeric")
                        mean(x)
            #returns na for the subject and activity variables
                  else
                        "N/A")
      )
      #writes the description data frame to a file and separate it so it creates a nice table in .md format
      write.table(df, "codeBook.md", sep = " | ",row.names=F)
}
