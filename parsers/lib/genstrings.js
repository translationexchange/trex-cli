#!/usr/bin/env node

/**
 * Program options and arguments
 */
var program = require('commander');

program
  .version('0.0.1')
  .option('-h, --help', 'Shows help')
  .option('-l, --language <lang>', 'Input language')
  .option('-i, --list-languages', 'Print out supported input languages')
  .option('-o, --output-file <file>', 'Write output to file instead of stdout');

program
  .arguments("<file> [file...]");

program.parse(process.argv);

var opts = program.opts();

// If asked, print out suppoerted languages and exit
var ExtensionLanguageMap = {
  "m": "objc"
};

if (opts.listLanguages) {
  var map = ExtensionLanguageMap;
  var langs = [];
  for (var ext in map) {
    langs.push(map[ext]);
  }
  console.log("Supported languages: " + langs.join(", "));  
  process.exit(-1);
}

// Sanity checks
var files = program.args;
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
      var stat = fs.statSync(filePath);
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
      var stat = fs.statSync(dir);
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
  console.warn("< ["+lang+"] " + file);
  var grammar = grammarForLanguage(lang);
  var source = fs.readFileSync(file, 'utf8');
  
  var startTime = Date.now();
  var match = grammar.match(source);
  var endTime = Date.now();
  
  if (match.succeeded()) {
    console.warn("[OK] Parsed " + file + " in " + (endTime - startTime) + "ms");
  }
  else {
    console.warn("!!! Error parsing file: " + file);
    return;
  }
  
  var semanticData = getSemanticsDataForLanguage(lang);
  var semantics = grammar.semantics();
  loadSemanticsData(semantics, semanticData);
  var matchSemantics = semantics(match);
  var localizableStrings = matchSemantics.localizableStrings();
  
  console.warn("> " + file);
  
  return localizableStrings;
}

function main() {  
  var outputFile = opts.outputFile;
  var writeStream = null;
  if (outputFile) {
    var outDir = path.dirname(outputFile);
    if (!testIfDirectoryExists(outDir)) {
      console.log("!!!" + outDir + " Doesn't exist");
      fs.mkdirSync(outDir);
    }
    
    writeStream = fs.createWriteStream(outputFile, {
      'flags': 'w',
      'defaultEncoding': 'utf8'
    });
  }
  else {
    writeStream = process.stdout;
  }

  writeStream.write("[");
  
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
    
    var localizableStrings = parseFile(file, lang);
    var str = JSON.stringify(localizableStrings);
    if (str.length > 2) {
      str = str.substring(1, str.length - 1);
    }
    writeStream.cork();
    writeStream.write(str);
    if (i<files.length-1) {
      writeStream.write(",");
    }
    writeStream.uncork();
  }
  
  writeStream.write("]");
  if (writeStream !== process.stdout) {    
    writeStream.end();
  }
}

main();
