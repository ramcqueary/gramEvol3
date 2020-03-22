function (grammar, seqStart = NULL, startSymb = GrammarStartSymbol(grammar), max.depth = GrammarGetDepth(grammar), max.len = GrammarMaxSequenceLen(grammar, max.depth, startSymb), depth.map = NULL) 
{
    if (IsSymbolTerminal(startSymb)) {
        return(NULL)
    }
    if (max.len == 0) {
        return(NewGrammarOverFlow())
    }
    if (max.depth - length(depth.map) <= 0) {
        return(NewGrammarOverFlow())
    }
    if (GetNumNonTerminals(startSymb) > max.len) {
        return(NewGrammarOverFlow())
    }
    fullStartSeq = GrammarGetFirstSequence(grammar, seqStart, startSymb, max.depth, max.len)
    if (is.GrammarOverflow(fullStartSeq)) {
        return(fullStartSeq)
    }
    if (length(seqStart) < length(fullStartSeq)) {
        return(fullStartSeq)
    }
    seqStart = fullStartSeq
    possible.choices = GetPossibleRuleChoicesFirstSymbol(startSymb, grammar)
    if (length(seqStart) == 0) {
        seqStart = 0
    }
    current.codon = seqStart[1]
    restOfSequence = seqStart[-1]
    if (length(restOfSequence) == 0) {
        current.codon = current.codon + 1
    }
    if (current.codon >= possible.choices) {
        return(NewGrammarOverFlow())
    }
    for (i in current.codon:(possible.choices - 1)) {
        newSymb = ApplyGrammarRule(i, startSymb, grammar)
        new.depth.map = UpdateDepthMap(depth.map, newSymb, oldSymb = startSymb)
        new_seq = GrammarGetNextSequence.Recursive(grammar, seqStart = restOfSequence, startSymb = newSymb, max.len = max.len - 1, max.depth = max.depth, depth.map = new.depth.map)
        if (!is.GrammarOverflow(new_seq)) {
            new_seq = c(i, new_seq)
            break
        }
        restOfSequence = NULL
    }
    return(new_seq)
}
