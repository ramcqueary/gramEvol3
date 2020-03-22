function (symb) 
{
    grep.res.start = gregexpr("<", symb)[[1]]
    return(grep.res.start[1] == -1)
}
