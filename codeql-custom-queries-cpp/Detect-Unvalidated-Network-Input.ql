import cpp

from FunctionCall fc
where
  fc.getTarget().getName().matches("recv") or
  fc.getTarget().getName().matches("read") or
  fc.getTarget().getName().matches("fgets")
select fc, "Network input received without validation. Ensure proper input sanitization."