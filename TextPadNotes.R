Exercise 20

Use pivot_wider() to reshape growth_long to wide format with one column per year and call the result growth.

growth

{r}

## Making a local copy and removing pop_start and pop_end
ex20_wpop <- growth_long[, c(-4, -5)]

## Using the pivot_wider to make the data set in wide format, where end_year is moved up as a header and the growth and the values
growth <- ex20_wpop |> pivot_wider(names_from = end_year, values_from = growth) |> group_by(country)

head(growth)

Exercise 21

Make a hierarchical clustering of the growth data in 9 groups. The following hints can be used to achieve this:

Remove non-numerical columns from data

Calculate distances

Use hclust() to run the clustering algorithm.

Use cutree() to make the cluster labels.

Use mutate to add the cluster label as a variable to growth

{r}
## Making a local version
ex21_growth <- growth[, -c(1, 2, 3)]

## Calculating distance
ex21_growth_dvec <- dist(ex21_growth, method = "euclidean")

## Making the clustering
ex21_growth_hc <- hclust(ex21_growth_dvec)

## No cluster diagram is required, but this code provides a diagram
## rect.hclust(ex21_growth_hc, k = 9, border = 2:5)
## plot(ex21_growth_hc)
## View(ex21_growth_hc)

## Using 9 clusters to organize
clusters <- c(9)
cl <- cutree(ex21_growth_hc, k=clusters) |> as.data.frame()
cl |> head(5)

## Changing the name of the cluster column to "clust"
names(cl) <- paste0("clust")
rownames(cl) <- ex21_growth_hc$labels

## Combining the cluster output (cl) and the original "growth" dataframe
growth_clust <- cl |> mutate(growth)

## Making the clust column into a factor and not an int
growth_clust$clust <- as.factor(growth_clust$clust)

head(growth_clust)


Exercise 22

Use group_split() and lapply() similarly to below to extract the countries of each cluster and display them nicely with pander::pander():

growth_clust |>    group_split(clust) |>    lapply(function(x) x$country) |>    pander::pander()

{r}
growth_clust |> 
  group_split(clust) |> 
  lapply(function(x) x$country) |> 
  pander::pander()

Exercise 23