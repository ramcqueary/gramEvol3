function (x, y) 
{
    lx = length(x)
    ly = length(y)
    for (i in 1:ly) {
        x[lx + i] = y[i]
    }
    x
}
