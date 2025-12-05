import cpp

from FunctionCall fc, Function f
where
  fc.getTarget() = f and
  not exists(Variable v | fc.getAnArgument() = v.getAnAccess()) and
  not exists(AssignExpr ae | ae.getRValue() = fc)
select fc, "Unchecked return value of function " + f.getName()