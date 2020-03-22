function (ruleDef) 
{
    ruleDefIndex = sapply(ruleDef, function(r) r[[1]])
    for (i in 1:length(ruleDef)) attr(ruleDefIndex, ruleDef[[i]][[1]]) = i
    ruleSizes = sapply(ruleDef, function(r) length(r[[2]]))
    grammar = list(def = ruleDef, defIndex = ruleDefIndex, ruleSizes = ruleSizes, maxRuleSize = max(ruleSizes))
    grammar
}
