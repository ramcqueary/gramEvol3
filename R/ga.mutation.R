function (genome, mutationChance, genomeLen = length(genome), genomeMin, genomeMax, allowrepeat, dempeningFactor = 1) 
{
    mut_genomeLoc = runif(genomeLen) < mutationChance
    num_muts = sum(mut_genomeLoc)
    direction = runif(num_muts) - 0.5
    mutationRange = genomeMax[mut_genomeLoc] - genomeMin[mut_genomeLoc]
    mutation = round(genome[mut_genomeLoc] + direction * mutationRange * dempeningFactor)
    bad_mutations = which((mutation < genomeMin[mut_genomeLoc]) | (mutation > genomeMax[mut_genomeLoc]))
    for (b in bad_mutations) {
        mutation[bad_mutations] = ga.rand.int(n = 1, genomeMin[mut_genomeLoc][b], genomeMax[mut_genomeLoc][b])
    }
    genome[mut_genomeLoc] = mutation
    if (!allowrepeat) {
        genome = ga.unique.maker(genome, genomeMin, genomeMax)
    }
    return(list(newGenome = genome, numMutations = num_muts))
}
