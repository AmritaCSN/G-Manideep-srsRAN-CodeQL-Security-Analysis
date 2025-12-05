import cpp

from FunctionCall checkCall, FunctionCall useCall
where
  checkCall.getTarget().getName() in ["access", "stat", "fstat"] and
  useCall.getTarget().getName() in ["open", "unlink", "remove"] and
  checkCall.getArgument(0) = useCall.getArgument(0)
select useCall, "Possible TOCTOU vulnerability: File checked before being used."