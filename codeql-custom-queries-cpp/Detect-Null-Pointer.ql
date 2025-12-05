import cpp

from FunctionCall fc, Variable v
where
  v.getType() instanceof PointerType and  // Ensure v is a pointer
  fc.getArgument(0) = v.getAnAccess() and // Check if pointer is passed as an argument
  not exists(IfStmt ifs |                 // Ensure there's no if-condition checking the pointer
    ifs.getCondition().getAChild*() = v.getAnAccess()
  )
select fc, "Potential null pointer dereference on variable: " + v.getName()
