import cpp

from FunctionCall execCall
where execCall.getTarget().hasName("system") and
      execCall.getArgument(0).toString().matches(".*sudo.*")
select execCall, "Privilege escalation risk: Code executes commands as root without validation."