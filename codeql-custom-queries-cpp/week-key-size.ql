import cpp

from FunctionCall fc1, FunctionCall fc2, Function f1, Function f2
where 
    fc1.getTarget() = f1 and f1.hasName("srand") and
    fc2.getTarget() = f2 and f2.hasName("time") and
    fc1.getArgument(0) = fc2
select fc1, "Predictable random seed detected. Use a secure PRNG like OpenSSL RAND_bytes()."