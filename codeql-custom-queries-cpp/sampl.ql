import cpp

from StringLiteral s
where
  s.getValue().matches("%pass%") or
  s.getValue().matches("%key%") or
  s.getValue().matches("%secret%")
select s, "Hardcoded password or key detected."


// import cpp

// from StringLiteral s
// where
//   s.getValue().matches("%pass%") or
//   s.getValue().matches("%key%") or
//   s.getValue().matches("%secret%")
//   and
//   not s.getLocation().getFile().getBaseName().matches("%test%")
// select s, "Possible hardcoded password, key, or secret detected in a string literal."


