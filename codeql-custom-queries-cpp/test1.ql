import cpp
import semmle.code.cpp.dataflow.DataFlow

from FunctionCall mallocCall, Expr mallocResult
where
    mallocCall.getTarget().hasName("malloc") and
    mallocResult = mallocCall.getArgument(0) and
    not exists(FunctionCall freeCall |
        freeCall.getTarget().hasName("free") and
        freeCall.getArgument(0) = mallocResult
    )
select mallocCall, "Memory allocated with malloc is never freed."
