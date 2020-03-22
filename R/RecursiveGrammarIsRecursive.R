function (grammar, startSymb = GrammarStartSymbol(grammar), symb.list = NULL) 
{
    same.level.symbols = list()
    while (IsSymbolTerminal(startSymb) == FALSE) {
        sep.symbs = GetFirstNonTerminalandRest(startSymb)
        nonterminal = sep.symbs$nonterminal
        if (!nonterminal %in% same.level.symbols) {
            if (nonterminal %in% symb.list) {
                return(TRUE)
            }
            symb.list = c(symb.list, nonterminal)
            same.level.symbols = c(same.level.symbols, nonterminal)
            possible.choices = GetPossibleRuleChoices(nonterminal, grammar)
            is.recursive = sapply(1:possible.choices, function(choice.no) {
                chosen.rule = ChosenGrammarRule(nonterminal, choice.no, grammar)
                RecursiveGrammarIsRecursive(grammar, startSymb = chosen.rule, symb.list)
            })
            if (any(is.recursive)) {
                return(TRUE)
            }
        }
        startSymb = sep.symbs$rest
    }
    return(FALSE)
}
