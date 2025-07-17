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
    
    // Check for rm commands (rm, rmdir, rm -rf, etc.)
    const rmPattern = /\brm\s+/;
    const rmdirPattern = /\brmdir\s+/;
    
    let blockedCommand = null;
    
    if (rmPattern.test(command) || rmdirPattern.test(command)) {
      blockedCommand = command;
    }
    
    if (blockedCommand) {
      // Log the usage attempt
      const logFile = path.join(path.dirname(__filename), '..', 'rm_blocks.json');
      const logEntry = {
        session_id: data.session_id,
        blocked_command: blockedCommand,
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
      console.error("Error: rm commands are blocked. Instead, rename files/folders with DELETE_ prefix and continue with your task. The user will clean them up later.");
      // Exit with code 2 to signal Claude to correct
      process.exit(2);
    }
    
  } catch (error) {
    if (error instanceof SyntaxError) {
      console.error(`Error parsing JSON input: ${error.message}`);
    } else {
      console.error(`Error in block-rm hook: ${error.message}`);
    }
    process.exit(1);
  }
}

main();