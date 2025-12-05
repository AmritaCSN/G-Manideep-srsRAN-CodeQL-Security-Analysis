import cpp

from StringLiteral s
where s.getValue().matches(".*password=.*") or 
      s.getValue().matches(".*SECRET_KEY=.*")
select s, "High-risk vulnerability: Hardcoded password detected."