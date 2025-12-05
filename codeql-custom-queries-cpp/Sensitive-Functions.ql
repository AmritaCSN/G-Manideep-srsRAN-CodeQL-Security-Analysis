import cpp

from Variable v, FunctionCall call1, FunctionCall call2
where
  call1.getTarget().getName() = "free" and
  call1.getArgument(0) = v.getAnAccess() and
  call2.getTarget().getName().matches(".*(memcpy|strcpy|strncpy|malloc).*") and
  call2.getArgument(0) = v.getAnAccess() and
  call1.getLocation().getStartLine() < call2.getLocation().getStartLine()
select call2, "Use-after-free detected: memory used after being freed."