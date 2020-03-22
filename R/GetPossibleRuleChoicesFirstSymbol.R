function (symbol, grammar) 
{
    TERMINAL = TRUE
    NON_TERMINAL = FALSE
    sep.symbs = GetFirstNonTerminalandRest(symbol)
    if (sep.symbs[[1]] == NON_TERMINAL) {
        return(0)
    }
    possible.choices = GetPossibleRuleChoices(sep.symbs$nonterminal, grammar)
    return(possible.choices)
}
