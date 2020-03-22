function (ruleDef, startSymb) 
{
    if (("connection" %in% class(ruleDef)) | is.character(ruleDef)) {
        ruleDef = ReadBNFFile(ruleDef)
    }
    if ("GERule" %in% class(ruleDef[[1]])) {
        ruleDef = SymbolicRuleToListRule(ruleDef)
    }
    for (i in seq_along(ruleDef)) {
        ruleDef[[i]][[1]] = trim_brackets(ruleDef[[i]][[1]])
    }
    grammar = CreateGrammarFromTextList(ruleDef)
    if (missing(startSymb)) {
        startSymb = as.character(grammar$defIndex[1])
    }
    grammar$startSymb = paste0("<", trim_brackets(startSymb), ">")
    class(grammar) = "grammar"
    return(grammar)
}
