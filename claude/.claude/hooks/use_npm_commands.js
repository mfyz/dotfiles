#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

async function main() {
  try {
    // Read input data from stdin
    let inputData = '';
    process.stdin.setEncoding('utf8');
    
    for await (const chunk of process.stdin) {
      inputData += chunk;
    }
    
    const data = JSON.parse(inputData);
    const toolInput = data.tool_input || {};
    const command = toolInput.command || '';
    
    if (!command) {
      process.exit(0);
    }
    
    // Check for direct tool usage instead of npm scripts
    const jestPattern = /\b(jest|npx jest)\b/;
    const playwrightPattern = /\b(playwright test|npx playwright test)\b/;
    const phpunitPattern = /\b(phpunit|vendor\/bin\/phpunit|\.\/vendor\/bin\/phpunit)\b/;
    
    let blockedCommand = null;
    let suggestedCommand = null;
    
    if (jestPattern.test(command)) {
      blockedCommand = command;
      suggestedCommand = "npm test (or check package.json for available test scripts)";
    } else if (playwrightPattern.test(command)) {
      blockedCommand = command;
      suggestedCommand = "npm run e2e (or check package.json for available e2e scripts)";
    } else if (phpunitPattern.test(command)) {
      blockedCommand = command;
      suggestedCommand = "npm test (or check package.json for available test scripts that set up PHP test environment)";
    }
    
    if (blockedCommand) {
      // Log the usage attempt
      const logFile = path.join(path.dirname(__filename), '..', 'npm_commands_enforcement.json');
      const logEntry = {
        session_id: data.session_id,
        blocked_command: blockedCommand,
        suggested_command: suggestedCommand,
        timestamp: new Date().toISOString()
      };
      
      // Load existing logs or create new array
      let logs = [];
      try {
        if (fs.existsSync(logFile)) {
          const content = fs.readFileSync(logFile, 'utf8');
          logs = JSON.parse(content);
        }
      } catch (e) {
        // If error reading/parsing, start fresh
        logs = [];
      }
      
      logs.push(logEntry);
      
      // Save logs
      fs.writeFileSync(logFile, JSON.stringify(logs, null, 2));
      
      // Send error message to stderr for Claude to see
      console.error(`Error: Use npm scripts instead of direct tool commands. ${suggestedCommand}`);
      // Exit with code 2 to signal Claude to correct
      process.exit(2);
    }
    
  } catch (error) {
    if (error instanceof SyntaxError) {
      console.error(`Error parsing JSON input: ${error.message}`);
    } else {
      console.error(`Error in use-npm-commands hook: ${error.message}`);
    }
    process.exit(1);
  }
}

main();
