function (grammar, max.depth = GetGrammarDepth(grammar), startSymb = GrammarStartSymbol(grammar), ...) 
{
    if ((!IsSymbolTerminal(startSymb)) & (max.depth == 0)) 
        return(-1)
    depth = 0
    while (IsSymbolTerminal(startSymb) == FALSE) {
        sep.symbs = GetFirstNonTerminalandRest(startSymb)
        possible.choices = GetPossibleRuleChoices(sep.symbs$nonterminal, grammar)
        depth_list = sapply(1:possible.choices, function(choice.no) {
            chosen.rule = ChosenGrammarRule(sep.symbs$nonterminal, choice.no, grammar)
            GrammarMaxSequenceLen(grammar, max.depth - 1, startSymb = chosen.rule)
        })
        if (max(depth_list) == -1) 
            return(-1)
        depth = depth + 1 + max(depth_list)
        startSymb = sep.symbs$rest
    }
    return(depth)
}
