const reporter = require('cucumber-html-reporter');

const options = {
  theme: 'bootstrap',
  jsonFile: 'report/full.json',
  output: 'report/cucumber_report.html',
  reportSuiteAsScenarios: true,
  launchReport: false,
};

reporter.generate(options);