import cpp

from FunctionCall insecureNetCall, Variable socketVar
where
    (
        insecureNetCall.getTarget().hasName("send") or 
        insecureNetCall.getTarget().hasName("recv") or 
        insecureNetCall.getTarget().hasName("connect")
    ) 
    and
    (
        exists(Type t | socketVar.getType() = t and t.hasName("int")) // Check if variable is an integer (socket descriptor)
    )
    and not exists(FunctionCall secureCall | secureCall.getTarget().hasName("SSL_connect"))
select insecureNetCall, "Potential security risk: Insecure network function used without encryption."


