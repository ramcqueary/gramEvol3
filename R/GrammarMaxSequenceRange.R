function (grammar, max.depth = GrammarGetDepth(grammar), startSymb = GrammarStartSymbol(grammar), ...) 
{
    seq.list = GetSequenceRanges(grammar, max.depth, startSymb)
    max.seq.len = max(sapply(seq.list, length))
    seq.len.equal = lapply(seq.list, function(x) c(x, rep.int(0, max.seq.len - length(x))))
    max.seq = do.call(pmax, seq.len.equal)
    return(as.numeric(max.seq))
}
