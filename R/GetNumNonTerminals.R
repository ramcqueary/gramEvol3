function (startSymb) 
{
    x = 0
    while (!IsSymbolTerminal(startSymb)) {
        x = x + 1
        sep.symb = GetFirstNonTerminalandRest(startSymb)
        startSymb = sep.symb$rest
    }
    return(x)
}
