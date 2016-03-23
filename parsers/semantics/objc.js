module.exports = {
  "operations": {
    "localizableStrings": {
      "ListOf_some": function(first, separator, iter) {
        var result = [];
        var firstString = first.localizableStrings();
        if (firstString) {
          result.push(firstString);
        }
        var children = iter.children;
        for (var i = 0; i < children.length; i++) {
          var child = children[i];
          var childString = child.localizableStrings();
          if (childString) {
            result.push(childString);
          }
        }
        return result;
      },
      "Exp": function(_, parts, tail) {
        var result = parts.localizableStrings();
        var newResult = [];
        debugger;
        for (var i=0; i<result.length; i++) {
          var r = result[i];
          if (r instanceof Array) {
            newResult = newResult.concat(r);
          }
          else {
            newResult.push(r);
          }
        }
        return newResult;
      },
      "TMLExp": function(macro, open, label, sep, args, close, space, semicolon) {
        var results = [];
        var labelString = label.localizableStrings();
        if (labelString.length > 0) {
          results.push(labelString);
        }
        else {
          return null;
        }
        var argResult = args.localizableStrings();
        if (argResult && argResult.length > 0) {
          var argStr = argResult[0];
          if (argStr instanceof Array) {
            argStr = argStr[0];
          }
          if (argStr) {
            results.push(argStr);
          }
        }
        var info = {"label": results[0]};
        if (results.length > 1) {
          info["comment"] = results[1];
        }
        debugger;
        return info;
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
      "ArrayAccessExp": function(varname, open, arg, close) {
        return "";
      },
      "MessageExp": function(msg) {
        return "";
      },
      "NoArgumentMessageExp": function(ope, receiver, message, close) {
        return "";
      },
      "ArgumentMessageExp": function(open, receiver, messages, args, close) {
        return "";
      },
      "MessageComponent": function(parts) {
        return "";
      },
      "messageComponentChar": function(e) {
        return "";
      }
    }
  }
}
