const core = require('@actions/core');
const github = require('@actions/github');
const linguist = require('js-linguist');

try {
    const path = core.getInput('path');
    console.log(`Checking ${path}...`);
    core.setOutput("data", JSON.stringify(linguist()));
    // Get the JSON webhook payload for the event that triggered the workflow
    const payload = JSON.stringify(github.context.payload, undefined, 2)
    console.log(`The event payload: ${payload}`);
} catch (error) {
    core.setFailed(error.message);
}