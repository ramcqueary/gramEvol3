function (x, ...) 
{
    cat("Start Symbol:               ", x$Start.Symbol, "\n")
    cat("Is Recursive:               ", x$Is.Recursive, "\n")
    if (x$Is.Recursive) 
        cat("Tree Depth:                  Limited to", x$Tree.Depth, "\n")
    else cat("Tree Depth:                 ", x$Tree.Depth, "\n")
    cat("Maximum Rule Choices:       ", x$Maximum.Rule.Size, "\n")
    cat("Maximum Sequence Length:    ", x$Maximum.Sequence.Length, "\n")
    cat("Maximum Sequence Variation: ", x$Maximum.Sequence.Variation, "\n")
    cat("No. of Unique Expressions:  ", x$No.of.Unique.Expressions, "\n")
}
