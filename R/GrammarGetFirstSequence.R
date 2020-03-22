function (grammar, seqStart = NULL, startSymb = GrammarStartSymbol(grammar), max.depth = GrammarGetDepth(grammar), max.len = GrammarMaxSequenceLen(grammar, max.depth, startSymb)) 
{
    GrammarGetFirstSequence.Recursive(grammar, seqStart = seqStart, startSymb = startSymb, max.depth = max.depth, max.len = max.len, depth.map = NULL)
}
