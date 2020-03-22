function (...) 
{
    ret = list(overflow = TRUE, ...)
    class(ret) = "GrammarOverflow"
    return(ret)
}
