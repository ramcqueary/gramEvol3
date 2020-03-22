function (depth.map, newSymb, oldSymb) 
{
    numOldNonTerms = GetNumNonTerminals(oldSymb)
    numNewNonTerms = GetNumNonTerminals(newSymb)
    numAddedNonTerms = numNewNonTerms - numOldNonTerms
    lenDepth = length(depth.map)
    if (lenDepth > 0) {
        depth.map[lenDepth] = depth.map[lenDepth] - 1
    }
    if (numAddedNonTerms >= 0) {
        depth.map = c(depth.map, numAddedNonTerms + 1)
    }
    while (length(depth.map) > 0) {
        if (tail(depth.map, 1) <= 0) {
            depth.map = depth.map[-length(depth.map)]
        }
        else {
            break
        }
    }
    return(depth.map)
}
