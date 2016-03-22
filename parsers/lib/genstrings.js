#!/usr/bin/env node

if (process.argv.length <= 2) {
  console.log("Usage: " + __filename + " grammar.ohm source.m");
  process.exit(-1);
}

var fs = require('fs');
var ohm = require('ohm-js');

var grammarFile = process.argv[2];
var sourceFile = process.argv[3];

function croak(message) {
  console.error("ERROR: " + message);
  process.exit(-1);
}

try {
    var stat = fs.lstatSync(grammarFile);
    if (!stat || !stat.isFile()) {
      croak("No such file: " + grammarFile);
    }
    stat = fs.lstatSync(sourceFile);
    if (!stat || !stat.isFile()) {
      croak("No such file: " + sourceFile);
    }
}
catch (e) {
  croak("Error: " + e);
}

var grammarText = fs.readFileSync(grammarFile, 'utf8');
var sourceText = fs.readFileSync(sourceFile, 'utf8');

var grammar = ohm.grammar(grammarText);
var startTime = Date.now();
var match = grammar.match(sourceText);
var endTime = Date.now();

console.info("Parsing took " + (endTime - startTime) + "ms");

if (!match.succeeded()) {
  croak("Did not match any localizable strings");
}

var semantics = grammar.semantics();

var results = [];

semantics.addOperation("localizableStrings", {
  // "NonemptyListOf": function(first, separator, iter) {
  //   console.log("NonemptyListOf");
  //   console.dir(arguments);
  //   var result = [];
  //   var firstString = first.localizableStrings();
  //   if (firstString) {
  //     result.push(firstString);
  //   }
  //   var children = iter.children;
  //   for (var i=0; i<children.length; i++) {
  //     var child = children[i];
  //     var childString = child.localizableStrings();
  //     if (childString) {
  //       result.push(childString);
  //     }
  //   }
  //   return result;
  //   // return parts.localizableStrings();
  // },
  "ListOf_some": function(first, separator, iter) {
    var result = [];
    var firstString = first.localizableStrings();
    if (firstString) {
      result.push(firstString);
    }
    var children = iter.children;
    for (var i=0; i<children.length; i++) {
      var child = children[i];
      var childString = child.localizableStrings();
      if (childString) {
        result.push(childString);
      }
    }
    return result;
    // return parts.localizableStrings();
  },
  "Exp": function(_, parts, tail) {
    return parts.localizableStrings();
  },
  "TMLExp": function(macro, open, args, close, space, semicolon) {
    var result = args.localizableStrings();
    results.push(result);
    return result;
  },
  "Macro": function(e) {
    return "";
  },
  "ArgsExp": function(e) {
    return e.localizableStrings();
  },
  "NullExp": function(e) {
    return "";
  },
  "VariableExp": function(parts) {
    return "";
  },
  "LiteralExp": function(e) {
    console.log("LiteralExp");
    console.dir(arguments);
    return e.localizableStrings();
  },
  "ObjectExp": function(e) {
    return e.localizableStrings();
  },
  "NumberExp": function(parts) {
    return "";
  },
  "NumberObjectExp": function(_, num) {
    return "";
  },
  "StringObjectExp": function(open, str, close, additionalLines) {
    var result = str.localizableStrings();
    if (additionalLines && additionalLines.interval.contents.length > 0) {
      var additionalString = additionalLines.localizableStrings();
      if (additionalString) {        
        result += "\n" + additionalString;
      }
    }
    return result;
  },
  "StringObjectAdditionalLinesExp": function(open, str, close) {
    var result = str.localizableStrings();
    if (result instanceof Array) {
      result = result.join("");
    }
    return result;
  },
  "StringExp": function(open, str, close) {
    return str.localizableStrings();
  },
  "stringCharsExp": function(parts) {
    var str = parts.localizableStrings().join("");
    return str;
  },
  "stringChar": function(char) {
    return this.interval.contents;
  },
  "BeginStringQuote": function(e) {
    return "";
  },
  "BeginSecondLineStringQuote": function(e) {
    return "";
  },
  "EndStringQuote": function(e) {
    return "";
  },
  "DictExp": function(open, parts, close) {
    return "";
  },
  "DictEntryExp": function(key, _, val) {
    return "";
  },
  "DictValueExp": function(e) {
    return e.localizableStrings();
  },
  "ArrayExp": function(open, parts, close) {
    return "";
  },
  "ArrayEntryExp": function(e) {
    return e.localizableStrings();
  },
  "MessageExp": function(open, receiver, argExp, close) {
    return "";
  },
  "NoArgumentMessageExp": function(parts) {
    return "";
  },
  "ArgumentMessageExp": function(messageName, _, args) {
    return "";
  },
  "MessageComponent": function(parts) {
    return "";
  },
  "messageComponentChar": function(e) {
    return "";
  }
});

var matchSemantics = semantics(match);
matchSemantics.localizableStrings();

console.log("Results:");
console.dir(results);
