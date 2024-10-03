## Import statements

library(ggplot2)
library(broom)
library(dplyr)

dat <- doBy::income |> 
  filter(race != "w" & educ <= 16 & educ >=12)

pl0 <- dat |> ggplot(aes(x=educ, y=inc, color=race)) + geom_jitter(width=0.1)
pl0 + geom_smooth(method="lm", aes(group=1), se=FALSE)

lm_fit1 <- lm(inc ~ educ, data=dat)
## The estimate column are the least squares estimates of the coefficients. That is, if the model is yi=b1+b2xi+ei , then 
## the estimate of b1 is Intercept and the estimate of b2 is educ.
## RSS=∑i=1n(yi−b1−b2xi)2
## y = the observed values and b1 where the line is, the difference being the distance of the observed value to the line, b1 is 
## where the data point should be if there was no "noise" 
## Std.error measures the uncertainty. The smaller the std.error is, the more reliable the 
tidy(lm_fit1)

set.seed(2024) # for reproducibility. Random number, could be anything, but as long as it's the same the random number has the 
## starting point

## The point being here, that we cannot repeat the experiment and only have one data set. So we remove some observations and have
## some observations represeted twice. If the model gives the same result with each run, it's robust and if not, well then it's not
## very robust
i <- sample(nrow(dat), replace = T)
dat_new <- dat[i,]
dat |> head()

dat_new |> head()

## Re-use model formula but fit model to new dataset. 
mm_new <- update(lm_fit1, data=dat_new)
## Same as writing 
## mm_new <- lm(inc ~ educ, data=dat_new)
coef(mm_new)

coef(lm_fit1)

set.seed(2024) # for reproducibility
parm <- replicate(999, {
  dat_new <- dat[sample(nrow(dat), replace = T),]
  mm_new <- update(lm_fit1, data=dat_new)
  coef(mm_new)
})

parm <- parm |> t() 
parm |> head()

tidy(lm_fit1)

sd(parm[,1])
sd(parm[,2])