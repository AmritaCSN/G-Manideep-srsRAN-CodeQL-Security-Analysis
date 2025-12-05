import cpp

from FunctionCall fc
where 
    fc.getTarget().hasName("memcmp") and
    exists(Expr sizeArg | sizeArg = fc.getArgument(2) and sizeArg instanceof Literal)
select fc, "Use of memcmp() for cryptographic comparison detected. Use a constant-time comparison function like OpenSSL's CRYPTO_memcmp()."
