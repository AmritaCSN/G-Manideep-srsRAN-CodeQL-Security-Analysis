import cpp

from FunctionCall fc
where
  fc.getTarget().hasName(["strcpy", "sprintf", "strcat"])
select fc, "Potential buffer overflow risk: Use safer alternatives like strncpy or snprintf."

// /**
//  * @name Unsafe buffer copy usage (possible buffer overflow)
//  * @description Flags calls to unsafe functions like strcpy, strcat, sprintf, etc.
//  * @kind problem
//  * @tags security, external/cwe/cwe-120, buffer-overflow
//  */

//  import cpp

//  from FunctionCall call
//  where
//    call.getTarget().hasName("strcpy") or
//    call.getTarget().hasName("strcat") or
//    call.getTarget().hasName("sprintf") or
//    call.getTarget().hasName("vsprintf") or
//    call.getTarget().hasName("gets") or
//    call.getTarget().hasName("scanf") or
//    call.getTarget().hasName("sscanf")
//  select call,
//    "Potential buffer overflow: call to unsafe function '" + call.getTarget().getName() + "'."
 