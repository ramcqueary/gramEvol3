function (expressions, envir = parent.frame()) 
{
    vals <- list()
    if (class(expressions) == "expression") {
        expressions = as.list(expressions)
        for (expr in expressions) {
            result <- eval(expr, envir = envir)
            vals <- c(vals, list(result))
        }
    }
    else {
        if (class(expressions) == "GEPhenotype") {
            expressions = as.list(expressions)
        }
        vals <- list()
        for (expr in expressions) {
            if (class(expr) == "GEPhenotype") {
                if (expr$type == "T") {
                  expr = expr$parsed
                }
                else {
                  warning("Can not evaluate non-terminal expression")
                  expr = "NA"
                }
            }
            else if (class(expr) == "character") {
                expr = parse(text = expr)
            }
            else if (class(expr) != "expression") {
                warning("Can not evaluate invalid expression")
                expr = "NA"
            }
            result <- eval(expr, envir = envir)
            vals <- c(vals, list(result))
        }
    }
    if (length(expressions) == 1) 
        return(vals[[1]])
    vals = do.call(data.frame, vals)
    colnames(vals) = paste0("expr", seq_along(expressions))
    return(vals)
}
