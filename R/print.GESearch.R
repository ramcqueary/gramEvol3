function (x, ..., max.line.len = 60) 
{
    cat("GE Search Results:\n")
    cat("  Expressions Tested:", x$numExpr, "\n")
    if (!is.null(x$currentExpression)) {
        cat("  Current Expression:", as.character(x$currentExpression), "\n")
        cat("  Current Cost:      ", x$currentCost, "\n")
    }
    else {
        cat("  Best Chromosome:   ", x$bestSequence, "\n")
    }
    cat("  Best Expression:   ", as.character(x$bestExpression), "\n")
    cat("  Best Cost:         ", x$bestCost, "\n")
}
