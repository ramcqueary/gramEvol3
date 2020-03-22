function (x, ...) 
{
    cat("Evolution Strategy Search Results:\n")
    cat("  No. Generations:", as.character(x$population$currentIteration), "\n")
    cat("  Best Genome:    ", as.character(x$best$genome), "\n")
    cat("  Best Cost:      ", as.character(x$best$cost), "\n")
}
