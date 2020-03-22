function (...) 
{
    rule = eval(substitute(alist(...)))
    class(rule) = "GERule"
    return(rule)
}
