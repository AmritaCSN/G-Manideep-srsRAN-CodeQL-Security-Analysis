import cpp

from FunctionCall netCall
where netCall.getTarget().hasName("send") and 
      netCall.getArgument(0).toString().matches(".*password.*") and 
      not exists(FunctionCall sslCall | sslCall.getTarget().hasName("SSL_write"))
select netCall, "Sensitive data sent over an unencrypted connection."