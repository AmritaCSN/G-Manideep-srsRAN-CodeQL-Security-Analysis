import cpp

from FunctionCall fc
where 
    fc.getTarget().getName().matches("getenv") or
    fc.getTarget().getName().matches("strcpy") or
    fc.getTarget().getName().matches("system")
select fc, "Potential insecure API usage detected."