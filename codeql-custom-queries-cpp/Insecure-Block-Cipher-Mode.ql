import cpp

from FunctionCall fc, Function f, FunctionCall argCall
where 
    fc.getTarget() = f and 
    f.hasName("EVP_CIPHER_CTX_set_padding") and
    fc.getArgument(1) = argCall and
    argCall.getTarget().hasName("EVP_aes_128_ecb")
select fc, "AES ECB mode is insecure. Consider using CBC or GCM mode."