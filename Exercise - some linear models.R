dat <- palmerpenguins::penguins
dat <- dat[complete.cases(dat),]
head(dat)

pl0 = ggplot(dat, aes(x=flipper_length_mm, y=body_mass_g)) + 
 geom_point()
pl0 + geom_smooth(se=FALSE)

mm1 <- lm(body_mass_g ~ flipper_length_mm + I(flipper_length_mm^2), data=dat)
pl0 + geom_line(aes(y=fitted(mm1)))
