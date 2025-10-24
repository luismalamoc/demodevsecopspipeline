# Demo DevSecOps Pipeline

Java Spring Boot microservice demonstrating a complete DevSecOps pipeline with automated security analysis.

## Tech Stack

- Java 21 + Spring Boot
- Gradle
- GitHub Actions
- Docker

## Pipeline Steps

The pipeline runs automatically on push with the following jobs:

1. **Build Job**
   - Compile with Gradle
   - Run unit tests
   - Generate JAR artifact

2. **SAST Job** - Semgrep
   - Static code analysis
   - Security vulnerability detection

3. **SCA Job** - OWASP Dependency-Check
   - Third-party dependency analysis
   - CVE detection (fails on CVSS >= 4)

4. **Container Scan Job** - Trivy
   - Docker image vulnerability scanning
   - OS and library analysis

