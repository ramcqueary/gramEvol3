function (ruleDef) 
{
    ruleDefIndex = names(ruleDef)
    escape_rule <- function(x) as.call(parse(text = paste0(".GE_lt.", as.character(x), ".GE_gt.")))
    ruleEscapeList = lapply(ruleDefIndex, escape_rule)
    names(ruleEscapeList) = ruleDefIndex
    for (i in 1:length(ruleDef)) {
        if (!"GERule" %in% class(ruleDef[[i]])) {
            stop("Invalid Grammar Ruleset")
        }
        if (!"GEStringRule" %in% class(ruleDef[[i]])) {
            for (j in 1:length(ruleDef[[i]])) {
                ruleDef[[i]][[j]] = SymbolicRuleToString(ruleDef[[i]][[j]], ruleDefIndex, ruleEscapeList)
            }
        }
        ruleDef[[i]] = list(ruleDefIndex[i], unclass(ruleDef[[i]]))
    }
    return(ruleDef)
}
