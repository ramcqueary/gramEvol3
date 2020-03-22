function (n, mins, maxs) 
{
    (mins - 1) + sample.int(maxs - mins + 1, n, replace = TRUE)
}
