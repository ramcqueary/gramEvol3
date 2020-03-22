function (x, ..., max.line.len = 60) 
{
    gen.spaces <- function(n) do.call(paste0, as.list(rep(" ", n)))
    maxLen = max(sapply(x$def, function(rule) nchar(rule[[1]])))
    for (rule in x$def) {
        spaces = maxLen - nchar(rule[[1]])
        expressions = lapply(rule[[2]], function(x) unescape.gt.lt(as.character(x)))
        for (i in 1:length(expressions)) {
            if (i + 1 > length(expressions)) 
                break
            if (i == 1) {
                leadspace = maxLen + 4
            }
            else {
                leadspace = 0
            }
            if (leadspace + nchar(expressions[[i]]) > max.line.len) {
                expressions[[i + 1]] = paste0("\n", gen.spaces(maxLen + 7), expressions[[i + 1]])
            }
        }
        cat(paste0("<", rule[[1]], ">"), gen.spaces(spaces), " ::= ", do.call(function(...) {
            paste(..., sep = " | ")
        }, expressions), "\n", ..., sep = "")
    }
}
