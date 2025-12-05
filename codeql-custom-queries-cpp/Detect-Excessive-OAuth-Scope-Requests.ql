import cpp

from FunctionCall fc
where
  fc.getTarget().getName() = "oauth_request_scope" and
  fc.getArgument(0).toString().matches(".*(admin|full_access|write_all|read_write).*")
select fc, "Potential least-privilege violation: OAuth request is asking for excessive permissions - " + fc.getArgument(0).toString()