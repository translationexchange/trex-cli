#!/usr/bin/env node

/**
 * Program options and arguments
 */
var program = require('commander');

program
  .version('0.0.1')
  .option('-h, --help', 'Shows help')
  .option('-l, --language', 'Input language')
  .option('-p, --print-supported-languages', 'Print out supported input languages')
  .option('-o, --output-directory', 'Output directory');

program
  .arguments("<file> [file...]");

program.parse(process.argv);

var files = program.args;

// Sanity checks
if (!files || files.length == 0) {
  program.outputHelp();
}


var fs = require('fs');
var path = require('path');
var ohm = require('ohm-js');


/**
 * FS helpers
 */
function testIfFileExists(filePath) {
  var exists = false;
  try {
      var stat = fs.lstatSync(filePath);
      if (stat && stat.isFile()) {
        exists = true;
      }
      
  }
  catch (e) {
  }
  return exists;
}
function testIfDirectoryExists(dir) {
  var exists = false;
  try {
      var stat = fs.lstatSync(dir);
      if (stat && stat.isDirectory()) {
        exists = true;
      }
      
  }
  catch (e) {
  }
  return exists;
}

/**
 * Language detection
 */
var ExtensionLanguageMap = {
  "m": "objc"
};
function languageForFileAtPath(filePath) {
  var extension = path.extname(filePath).substring(1);
  return ExtensionLanguageMap[extension];
}

/**
 * Grammar
 */
var KnownGrammars = {};
function grammarFilePathForLanguage(lang) {
  var ourPath = path.dirname(process.argv[1]);
  return ourPath + "/../grammar/" + lang + ".ohm";
}
function grammarForLanguage(lang) {
  var grammar = KnownGrammars[lang];
  if (!grammar) {
    var grammarFilePath = grammarFilePathForLanguage(lang);
    var grammarText = fs.readFileSync(grammarFilePath, 'utf8');
    grammar = ohm.grammar(grammarText);
    KnownGrammars[lang] = grammar;
  }
  return grammar;
}

/**
 * Semantics
 */
function semanticsFilePathForLanguage(lang) {
  var ourPath = path.dirname(process.argv[1]);
  return ourPath + "/../semantics/" + lang + ".js";
}
function getSemanticsDataForLanguage(lang) {
  var semanticsFilePath = semanticsFilePathForLanguage(lang);
  var description = require(semanticsFilePath);
  return description;
}
function loadSemanticsData(semantics, data) {
  var operations = data["operations"];
  if (operations) {
    for (var operationName in operations) {
      semantics.addOperation(operationName, operations[operationName]);
    }
  }
  var attributes = data["attributes"];
  if (attributes) {
    for (var attrName in attributes) {
      semantics.addAttribute(attrName, attributes[attrName]);
    }
  }
}

/**
 * Parsing
 */
function parseFile(file, lang) {
  console.info("< ["+lang+"] " + file);
  var grammar = grammarForLanguage(lang);
  var source = fs.readFileSync(file, 'utf8');
  
  var startTime = Date.now();
  var match = grammar.match(source);
  var endTime = Date.now();
  
  if (match.succeeded()) {
    console.info("[OK] Parsed " + file + " in " + (endTime - startTime) + "ms");
  }
  else {
    console.error("!!! Error parsing file: " + file);
    return;
  }
  
  var semanticData = getSemanticsDataForLanguage(lang);
  var semantics = grammar.semantics();
  loadSemanticsData(semantics, semanticData);
  var matchSemantics = semantics(match);
  var localizableStrings = matchSemantics.localizableStrings();
  
  console.log("> " + file);
  console.dir(localizableStrings);
}

function main() {
  var opts = program.opts();
  
  if (opts.outputDirectory) {
    if (!testIfDirectoryExists(opts.outputDirectory)) {
      fs.mkdirSync(opts.outputDirectory);
    }
  }
  
  for (var i=0; i<files.length; i++) {
    var file = files[i];
    
    if (!testIfFileExists(file)) {
      console.warn("Cannot find file: " + file);
      continue;
    }
    
    var lang = opts["language"];
    if (!lang) {
      lang = languageForFileAtPath(file);
    }
    
    if (!lang) {
      console.warn("Could not determine source language");
      continue;
    }
    
    parseFile(file, lang);
  }
}

main();
