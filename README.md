# BDD API Test Framework

## Overview
This repository contains a Behavior-Driven Development (BDD) API test framework built with Ruby + Cucumber.  
It is designed to validate critical API workflows, ensuring continuous quality through automated pipelines in GitHub Actions.

## Goals
- Provide fast feedback on API availability via Smoke Tests.
- Validate complete business flows with Regression Tests.
- Integrate seamlessly into CI/CD pipelines for reliable automation.
- Deliver structured reports (JSON + HTML) for transparency and traceability.

## Project Structure

 bdd-api-test-framework/
    ├── features/
    │   ├── smoke/          # Critical smoke scenarios (run on PRs)
    │   ├── regression/     # Full regression suite (run on main)
    │   └── support/        # Ruby configs, hooks, and helpers
    ├── report/             # JSON and HTML reports
    ├── scripts/            # External utilities (e.g., HTML generation in Node.js)
    ├── Gemfile             # Ruby dependencies
    ├── package.json        # Node dependencies (reporter)
    └── .github/workflows/  # CI/CD pipelines

## Running Locally

### Requirements
- Ruby 3.2+
- Bundler
- Node.js 18+ (for HTML report generation)

### Install Dependencies
```bash
bundle install
npm install


Run Smoke Tests
bundle exec cucumber features/smoke/ --format pretty


Run Full Suite
bundle exec cucumber features/ --format pretty


Generate HTML Report
You have two options:
    - Using Node.js + cucumber-html-reporter
    First, run Cucumber to generate the JSON:
    bundle exec cucumber features/ --format json --out report/full.json
    Then convert it to HTML:
    node scripts/generate-report.js
    Requires Node.js (v18+) installed.

    - Using Cucumber native HTML output
    bundle exec cucumber -p html_report
    This uses the profile defined in cucumber.yml to generate a basic HTML report


CI/CD with GitHub Actions
- Pull Requests → executes only features/smoke/ for quick validation.
- Push to main → executes the full suite in features/.
- Reports are generated in JSON, converted to HTML, and published as artifacts.
Reporting
- JSON: structured output for integrations and dashboards.
- HTML: user-friendly visualization for analysis.
- Both are automatically generated in the pipeline.
Quality Strategy
- Smoke Tests: ensure critical endpoints are always available.
- Regression Tests: validate business rules and error handling.
- CI/CD Integration: fast feedback on PRs, full validation on main.
- Reports: provide transparency and traceability for the team.
Author
Valéria Santos – Senior QA Engineer
Focused on test automation, continuous quality, and CI/CD integration
