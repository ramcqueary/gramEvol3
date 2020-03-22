function (object, ...) 
{
    ret = list(Start.Symbol = GrammarStartSymbol(object), Is.Recursive = GrammarIsRecursive(object, ...), Tree.Depth = GrammarGetDepth(object, ...), Maximum.Sequence.Length = GrammarMaxSequenceLen(object, ...), Maximum.Rule.Size = GrammarMaxRuleSize(object), Maximum.Sequence.Variation = GrammarMaxSequenceRange(object, ...), No.of.Unique.Expressions = GrammarNumOfExpressions(object, ...))
    class(ret) <- "summary.grammar"
    return(ret)
}
