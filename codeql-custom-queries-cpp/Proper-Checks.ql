import cpp

from FunctionCall fc
where
  fc.getTarget().getName() in ["setuid", "setgid", "setreuid", "setregid", "system", "popen", "execvp", "execlp"]
  and not exists(
    IfStmt ifs |
    ifs.getCondition().toString().matches(".*(getuid|geteuid|getgid|getegid|cap_get_proc).*") and
    fc.getEnclosingFunction() = ifs.getEnclosingFunction()
  )
select fc, "Potential over-privilege flaw: " + fc.getTarget().getName() + " is used without proper validation."