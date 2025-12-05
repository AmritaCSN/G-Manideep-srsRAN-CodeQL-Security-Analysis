import cpp

from FunctionCall fc, Function f
where 
    fc.getTarget() = f and
    f.getName().matches("%access%") and  // Look for functions related to access control
    fc.getEnclosingFunction().getName() != f.getName()
select fc, "This function call may be over-privileged. Verify access controls."