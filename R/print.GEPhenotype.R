function (x, ..., simplify = TRUE) 
{
    if (x$type == "NT") {
        cat("Non-Terminal Sequence:\n", x$expr, "\n", ...)
    }
    else {
        cat(as.character(x, simplify = simplify), "\n", ...)
    }
}
