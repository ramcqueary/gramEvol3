function (grammar, numExpr = 1, max.depth = length(grammar$def), startSymb = GrammarStartSymbol(grammar), max.string = GrammarMaxSequenceRange(grammar, max.depth, startSymb), wrappings = 3, retries = 100) 
{
    n = length(max.string)
    ret.list = list()
    for (i in 1:numExpr) {
        for (j in 1:retries) {
            genome = round(runif(n) * max.string)
            expr = GrammarGenotypeToPhenotype(genome, grammar, wrappings)
            if (expr$type == "T") {
                ret.list[[length(ret.list) + 1]] = parse(text = as.character(expr$parsed))
                break
            }
        }
        if (expr$type == "NT") {
            ret.list[[length(ret.list) + 1]] = NULL
        }
    }
    if (numExpr == 1) 
        return(ret.list[[1]])
    else return(ret.list)
}
