function (grammar, max.depth = length(grammar$def), startSymb = grammar$startSymb) 
{
    stopifnot("grammar" %in% class(grammar))
    if (IsSymbolTerminal(startSymb)) 
        return(0)
    if (max.depth == 0) 
        return(NULL)
    TERMINAL = TRUE
    NON_TERMINAL = FALSE
    all_seq = list(NULL)
    while (IsSymbolTerminal(startSymb) == FALSE) {
        sep.symbs = GetFirstNonTerminalandRest(startSymb)
        non.terminal.symb = sep.symbs$nonterminal
        possible.choices = GetPossibleRuleChoices(non.terminal.symb, grammar)
        seq_list = lapply(1:possible.choices, function(choice.no) {
            chosen.rule = ChosenGrammarRule(non.terminal.symb, choice.no, grammar)
            GetSequenceRanges(grammar, max.depth - 1, startSymb = chosen.rule)
        })
        seq_list = unlist(seq_list, recursive = FALSE)
        seq_list = seq_list[!sapply(seq_list, is.null)]
        if (length(seq_list) == 0) {
            return(NULL)
        }
        is.zero = sapply(seq_list, function(x) ifelse(is.numeric(x), x == 0, FALSE))
        seq_list = seq_list[!is.zero]
        if (sum(is.zero) > 0) {
            seq_list[length(seq_list) + 1] = list(NULL)
        }
        all_seq = lapply(all_seq, function(s) lapply(seq_list, function(s2) c(s, possible.choices, s2)))
        all_seq = unlist(all_seq, recursive = FALSE)
        startSymb = sep.symbs$rest
    }
    return(all_seq)
}
