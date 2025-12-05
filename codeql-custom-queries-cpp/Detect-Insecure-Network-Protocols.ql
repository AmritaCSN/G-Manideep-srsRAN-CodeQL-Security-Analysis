import cpp

from FunctionCall fc
where
  fc.getTarget().getName().matches("connect") and
  fc.getArgument(1).toString().matches("http://%")
select fc, "Insecure HTTP detected. Use HTTPS instead."
