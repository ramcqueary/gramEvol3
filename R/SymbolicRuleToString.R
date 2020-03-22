function (current_rule, ruleDefIndex, ruleEscapeList) 
{
    escape_expression_rules <- function(expr) eval(substitute(substitute(e, ruleEscapeList), list(e = expr)))
    if (is.call.primitive(current_rule)) {
        current_rule = paste0("`", escape.gt.lt(current_rule), "`")
    }
    else {
        current_rule = escape_expression_rules(current_rule)
        current_rule = escape.gt.lt(GERule.EscapeDot(current_rule))
        for (r in ruleDefIndex) {
            rx = paste0(".GE_lt.", r, ".GE_gt.()")
            ry = paste0("<", r, ">")
            current_rule = gsub(rx, ry, current_rule, fixed = TRUE)
        }
        current_rule = paste(current_rule, sep = "", collapse = "\n")
    }
    return(current_rule)
}
