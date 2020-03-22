function (x, ...) 
{
    i = 0
    for (item in x) {
        str = do.call(paste, as.list(as.character(GERule.EscapeDot(item))))
        cat(paste0("Rule ", i, ": "))
        cat(str)
        cat("\n")
        i = i + 1
    }
}
