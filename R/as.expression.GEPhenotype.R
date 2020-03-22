function (x, ...) 
{
    if (x$type == "NT") {
        warning("Non-Terminal Sequence")
        NULL
    }
    else {
        x$parsed
    }
}
