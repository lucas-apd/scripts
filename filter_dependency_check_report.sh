q -r '[.dependencies[] | select(.evidenceCollected[] != []) | select( .vulnerabilities[0].severity == "HIGH" or .vulnerabilities[0].severity == "CRITICAL" ) \
| select(.fileName | contains("shaded") | not) | {Dependency: .fileName, Path: .filePath, Version: .evidenceCollected.versionEvidence[0].value, \
CVE: [.vulnerabilities[].name] , CWE: [.vulnerabilities[].cwes[]], Severity: .vulnerabilities[0].severity, Description: [.vulnerabilities[].description], \ 
Reference: .vulnerabilityIds[0].url }] | unique_by(.Dependency)' dependency_check.json
