import cpp

from FunctionCall freeCall, FunctionCall useCall
where 
    freeCall.getTarget().hasName("free") and
    exists(useCall.getTarget()) and
    freeCall.getEnclosingFunction() = useCall.getEnclosingFunction() and
    exists(freeCall.getLocation()) and exists(useCall.getLocation()) and
    useCall.getLocation().getStartLine() > freeCall.getLocation().getStartLine()
select useCall, "Use-after-free detected: memory is accessed after being freed."

