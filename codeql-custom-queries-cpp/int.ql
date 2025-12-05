import cpp

from BinaryOperation op
where
  op.getOperator() = "+" and
  op.getLeftOperand().getType().toString().matches("int|short|char") and
  op.getRightOperand().getType().toString().matches("int|short|char") and
  not op.getEnclosingFunction().getName().matches(".*safe.*")
select op, "Potential integer overflow detected."