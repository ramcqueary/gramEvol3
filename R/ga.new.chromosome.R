function (genomeLen, genomeMin, genomeMax, allowrepeat) 
{
    chromosome = round(runif(genomeLen) * (genomeMax - genomeMin) + genomeMin)
    if (!allowrepeat) {
        chromosome = ga.unique.maker(chromosome, genomeMin, genomeMax)
    }
    return(chromosome)
}
