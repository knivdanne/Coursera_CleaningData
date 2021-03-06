Description of the raw dataset can be found on below link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The raw data described on above link has been aggregated to a tidy data set which looks at the overall mean of each measurement variable that ends with mean() or std(), see full list below, grouped by subject and activity.
this tidy dataset is the file called tidy.csv
You can read the data into r by using the default read.csv() function with no extra settings.

Below is a table listing the various columns that were kept, together with their class, range, and mean.
And also the script that updates the table.


```R
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
```

column.names | class | range | mean
|---			|---	  |---		|---   |
subject | integer | 1  /  30 | N/A
activity | factor | LAYING / SITTING / STANDING / WALKING / WALKING_DOWNSTAIRS / WALKING_UPSTAIRS | N/A
tBodyAcc-mean()-X | numeric | 0.22159824394  /  0.3014610196 | 0.274302742245795
tBodyAcc-mean()-Y | numeric | -0.0405139534294  /  -0.00130828765170213 | -0.0178755238674415
tBodyAcc-mean()-Z | numeric | -0.152513899520833  /  -0.07537846886 | -0.109163815804519
tBodyAcc-std()-X | numeric | -0.996068635384615  /  0.626917070512821 | -0.557690076404401
tBodyAcc-std()-Y | numeric | -0.990240946666667  /  0.616937015333333 | -0.460462635378301
tBodyAcc-std()-Z | numeric | -0.987658662307692  /  0.609017879074074 | -0.575560246148636
tGravityAcc-mean()-X | numeric | -0.680043155060241  /  0.974508732 | 0.697477505882702
tGravityAcc-mean()-Y | numeric | -0.479894842941176  /  0.956593814210526 | -0.0162128361521394
tGravityAcc-mean()-Z | numeric | -0.49508872037037  /  0.9578730416 | 0.0741278709325255
tGravityAcc-std()-X | numeric | -0.996764227384615  /  -0.829554947808219 | -0.96375253077172
tGravityAcc-std()-Y | numeric | -0.99424764884058  /  -0.643578361424658 | -0.952429559765945
tGravityAcc-std()-Z | numeric | -0.990957249538462  /  -0.610161166287671 | -0.93640104156585
tBodyAccJerk-mean()-X | numeric | 0.0426880986186441  /  0.130193043809524 | 0.0794735599203562
tBodyAccJerk-mean()-Y | numeric | -0.0386872111282051  /  0.056818586275 | 0.00756520996888408
tBodyAccJerk-mean()-Z | numeric | -0.0674583919268293  /  0.0380533591627451 | -0.00495340328183431
tBodyAccJerk-std()-X | numeric | -0.994604542264151  /  0.544273037307692 | -0.594946699510964
tBodyAccJerk-std()-Y | numeric | -0.989513565652174  /  0.355306716915385 | -0.565414714340423
tBodyAccJerk-std()-Z | numeric | -0.993288313333333  /  0.0310157077775926 | -0.735957689241115
tBodyGyro-mean()-X | numeric | -0.205775427307692  /  0.19270447595122 | -0.0324371599031218
tBodyGyro-mean()-Y | numeric | -0.204205356087805  /  0.0274707556666667 | -0.0742595723452297
tBodyGyro-mean()-Z | numeric | -0.0724546025804878  /  0.179102058245614 | 0.0874446468695526
tBodyGyro-std()-X | numeric | -0.994276591304348  /  0.267657219333333 | -0.691639902777431
tBodyGyro-std()-Y | numeric | -0.994210471914894  /  0.476518714444444 | -0.653302029911363
tBodyGyro-std()-Z | numeric | -0.985538363333333  /  0.564875818162963 | -0.616435294332593
tBodyGyroJerk-mean()-X | numeric | -0.157212539189362  /  -0.0220916265065217 | -0.0960567959204382
tBodyGyroJerk-mean()-Y | numeric | -0.0768089915604167  /  -0.0132022768074468 | -0.0426927819752453
tBodyGyroJerk-mean()-Z | numeric | -0.0924998531372549  /  -0.00694066389361702 | -0.0548018825799509
tBodyGyroJerk-std()-X | numeric | -0.99654254057971  /  0.179148649684615 | -0.703632714557601
tBodyGyroJerk-std()-Y | numeric | -0.997081575652174  /  0.295945926186441 | -0.763551835158898
tBodyGyroJerk-std()-Z | numeric | -0.995380794637681  /  0.193206498960417 | -0.709559184010004
tBodyAccMag-mean() | numeric | -0.986493196666667  /  0.644604325128205 | -0.49728966685894
tBodyAccMag-std() | numeric | -0.986464542615385  /  0.428405922622222 | -0.543908670845839
tGravityAccMag-mean() | numeric | -0.986493196666667  /  0.644604325128205 | -0.49728966685894
tGravityAccMag-std() | numeric | -0.986464542615385  /  0.428405922622222 | -0.543908670845839
tBodyAccJerkMag-mean() | numeric | -0.99281471515625  /  0.434490400974359 | -0.607929591545179
tBodyAccJerkMag-std() | numeric | -0.994646916811594  /  0.450612065720513 | -0.584175609709768
tBodyGyroMag-mean() | numeric | -0.980740846769231  /  0.418004608615385 | -0.565163077212988
tBodyGyroMag-std() | numeric | -0.981372675614035  /  0.299975979851852 | -0.630394720315622
tBodyGyroJerkMag-mean() | numeric | -0.997322526811594  /  0.0875816618205128 | -0.736369300428253
tBodyGyroJerkMag-std() | numeric | -0.997666071594203  /  0.250173204117966 | -0.755015188509002
fBodyAcc-mean()-X | numeric | -0.995249932641509  /  0.537012022051282 | -0.575799983503946
fBodyAcc-mean()-Y | numeric | -0.989034304057971  /  0.524187686888889 | -0.488732713013952
fBodyAcc-mean()-Z | numeric | -0.989473926666667  /  0.280735952206667 | -0.62973875362598
fBodyAcc-std()-X | numeric | -0.996604570307692  /  0.658506543333333 | -0.552201112392524
fBodyAcc-std()-Y | numeric | -0.990680395362319  /  0.560191344 | -0.481478729871355
fBodyAcc-std()-Z | numeric | -0.987224804307692  /  0.687124163703704 | -0.582361415029381
fBodyAccJerk-mean()-X | numeric | -0.994630797358491  /  0.474317256051282 | -0.613928222283428
fBodyAccJerk-mean()-Y | numeric | -0.989398823913043  /  0.276716853307692 | -0.588163069360073
fBodyAccJerk-mean()-Z | numeric | -0.992018447826087  /  0.157775692377778 | -0.714358487490646
fBodyAccJerk-std()-X | numeric | -0.995073759245283  /  0.476803887476923 | -0.612103283207987
fBodyAccJerk-std()-Y | numeric | -0.990468082753623  /  0.349771285415897 | -0.570730968650136
fBodyAccJerk-std()-Z | numeric | -0.993107759855072  /  -0.00623647528983051 | -0.756489426411787
fBodyGyro-mean()-X | numeric | -0.99312260884058  /  0.474962448333333 | -0.636739605053057
fBodyGyro-mean()-Y | numeric | -0.994025488297872  /  0.328817010088889 | -0.676686800745998
fBodyGyro-mean()-Z | numeric | -0.985957788  /  0.492414379822222 | -0.604391244378742
fBodyGyro-std()-X | numeric | -0.994652185217391  /  0.196613286661538 | -0.711035658050846
fBodyGyro-std()-Y | numeric | -0.994353086595745  /  0.646233637037037 | -0.645433416234092
fBodyGyro-std()-Z | numeric | -0.986725274871795  /  0.522454216314815 | -0.657746585870822
fBodyAccMag-mean() | numeric | -0.986800645362319  /  0.586637550769231 | -0.536516692548498
fBodyAccMag-std() | numeric | -0.987648484461539  /  0.178684580868889 | -0.620963293005196
fBodyBodyAccJerkMag-mean() | numeric | -0.993998275797101  /  0.538404846128205 | -0.575617493234432
fBodyBodyAccJerkMag-std() | numeric | -0.994366667681159  /  0.316346415348718 | -0.599160868317743
fBodyBodyGyroMag-mean() | numeric | -0.986535242105263  /  0.203979764835897 | -0.667099099613148
fBodyBodyGyroMag-std() | numeric | -0.981468841692308  /  0.236659662496296 | -0.672322349574843
fBodyBodyGyroJerkMag-mean() | numeric | -0.997617389275362  /  0.146618569064407 | -0.756385271117363
fBodyBodyGyroJerkMag-std() | numeric | -0.99758523057971  /  0.287834616098305 | -0.771517051737343
