function (s) 
{
    s = gsub("<", ".$GElt$.", s, fixed = TRUE)
    s = gsub(">", ".$GEgt$.", s, fixed = TRUE)
    return(s)
}
