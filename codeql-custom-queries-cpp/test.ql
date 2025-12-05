import cpp

from FunctionCall mallocCall
where
  mallocCall.getTarget().hasName("malloc") and
  not exists(FunctionCall freeCall |
    freeCall.getTarget().hasName("free") and
    freeCall.getAnArgument() = mallocCall
  )
select mallocCall, "Memory allocated with malloc is never freed."