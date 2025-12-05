import cpp

from FunctionCall fc, Function f, Literal intArg
where 
    fc.getTarget() = f and
    f.hasName("SSL_CTX_set_verify") and
    fc.getArgument(1) = intArg and
    intArg.getValue() = "0"
select fc, "SSL certificate verification is disabled, leading to potential Man-in-the-Middle attacks."