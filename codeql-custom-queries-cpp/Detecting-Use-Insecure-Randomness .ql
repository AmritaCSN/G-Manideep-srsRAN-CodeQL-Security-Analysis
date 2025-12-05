import cpp

from FunctionCall fc, Function f
where 
    fc.getTarget() = f and
    (
        f.hasName("rand") or 
        f.hasName("srand")
    )
select fc, "Use of insecure randomness. Consider using a cryptographic random number generator."
