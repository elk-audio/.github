const core = require("@actions/core")

try {
  core.info("Starting action")
  const input = core.getInput("input");
  const defaults = core.getInput("defaults");
  const skip_empty_strings = core.getInput("skip-empty-strings");

  core.info(`Input: ${input}`);
  core.info(`Defaults: ${defaults}`);
  core.info(`Skip empty strings: ${skip_empty_strings}`);


  // parse
  const parsedInput = JSON.parse(input);
  const parsedDefaults = JSON.parse(defaults);

  core.info("Parsed input: " + JSON.stringify(parsedInput));
  core.info("Parsed defaults: " + JSON.stringify(parsedDefaults));
  
  if (skip_empty_strings == "true") {
    for (const key in parsedInput) {
      if (parsedInput[key] === "") {
        delete parsedInput[key];
      }
    }

    core.info("Parsed input after removing empty strings: " + JSON.stringify(parsedInput));
  }


  const merged = {...parsedDefaults, ...parsedInput};
  core.info("Merged: " + JSON.stringify(merged));
  core.setOutput("merged", JSON.stringify(merged));

} catch (error) {
  core.setFailed(
    `Action failed with error: ${error.message}`
  );
}

