function (x, ..., show.genome = FALSE) 
{
    cat("Grammatical Evolution Search Results:\n")
    cat("  No. Generations: ", as.character(x$population$currentIteration), "\n")
    if (show.genome) {
        cat("  Best Genome:     ", x$best$genome, "\n")
    }
    if (length(x$best$expressions) == 1) {
        cat("  Best Expression: ", as.character(x$best$expressions), "\n")
    }
    else {
        cat("  Best Expressions:", as.character(x$best$expressions[1]), "\n")
        for (i in 2:length(x$best$expressions)) {
            cat("                  :", as.character(x$best$expressions[i]), "\n")
        }
    }
    cat("  Best Cost:       ", as.character(x$best$cost), "\n")
}
