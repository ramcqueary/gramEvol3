function (rule) 
{
    if (length(rule) > 1) {
        if (as.character(rule[[1]]) == ".") {
            str = as.character(as.expression(rule))
            return(substr(str, 3, nchar(str) - 1))
        }
    }
    deparse(rule, width.cutoff = 400)
}
