import cpp

from FunctionCall forkCall
where
  forkCall.getTarget().getName() = "fork" and
  not exists(FunctionCall waitCall |
    waitCall.getTarget().getName() in ["wait", "waitpid"] and
    waitCall.getEnclosingFunction() = forkCall.getEnclosingFunction())
select forkCall, "Possible zombie process: fork() is used without waitpid()."