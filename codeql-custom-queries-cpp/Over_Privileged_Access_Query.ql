// Query: Detect functions that bypass access control checks
import cpp

// Identify functions with names suggesting privilege or access control
private predicate isPrivilegedFunction(Function f) {
  f.getName().matches("(?i).*access.*|.*auth.*|.*privilege.*")
}

from Function func, FunctionCall call
where 
  isPrivilegedFunction(func) and 
  call.getEnclosingFunction() = func and
  // Heuristic: the function makes no call to any Auth/Z check routine
  not exists(FunctionCall authCall |
              authCall.getEnclosingFunction() = func and 
              authCall.getTarget().getName().matches("check.*(Auth|Permission|Priv)"))
select func, "Function `" + func.getName() + "` may bypass access control checks."