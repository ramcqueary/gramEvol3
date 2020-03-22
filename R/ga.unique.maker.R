function (x, genomeMin, genomeMax) 
{
    while (TRUE) {
        dup = duplicated(x)
        if (!any(dup)) 
            break
        for (i in which(dup)) {
            x[i] = x[i] + 1
            if (x[i] > genomeMax[i]) {
                x[i] = genomeMin[i]
            }
        }
    }
    return(x)
}
