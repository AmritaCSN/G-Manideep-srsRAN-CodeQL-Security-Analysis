import cpp

// Find OAuth token generation functions
class OAuthTokenGen extends Function {
  OAuthTokenGen() {
    this.getName().matches("generateOAuthToken") or
    this.getName().matches("getAccessToken")
  }
}

// Identify weak scopes (service-level instead of operation-level)
from OAuthTokenGen func, StringLiteral scope
where
  scope.getEnclosingFunction() = func and  // Get string literals inside the function
  scope.getValue().matches("service-level-scope") // Detect weak scope usage
select func, scope, "OAuth token uses weak scope."
