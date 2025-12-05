import cpp

from FunctionCall fc, Function f
where 
  f = fc.getTarget() and
  exists(ReturnStmt rs | rs.getEnclosingFunction() = f and rs.getExpr() instanceof Literal) and
  not exists(IfStmt is | 
    exists(FunctionCall ifFc | ifFc = is.getCondition().(FunctionCall) and ifFc.getTarget() = f)
  )
select fc, "Unhandled error: function call result is not checked."
