function (...) 
{
    rule = list(...)
    class(rule) = c("GERule", "GEStringRule")
    return(rule)
}
