function (x, ..., simplify = TRUE) 
{
    expr = x$parsed
    if (simplify) {
        expr = parse(text = as.character(expr))
    }
    return(as.character(expr))
}
