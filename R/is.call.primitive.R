function (x) 
{
    if (length(x) != 1) {
        return(FALSE)
    }
    str = deparse(x)
    if (length(str) != 1) {
        return(FALSE)
    }
    if (length(grep("(", str, fixed = TRUE)) != 0) {
        return(FALSE)
    }
    return(is.primitive(try(eval(x), silent = TRUE)))
}
