'use strict';

// Originally from:
// https://github.com/evilpacket/eslint-rules/blob/master/no-unsafe-regex.js

var safe = require('safe-regex');

module.exports = function (context) {
  return {
    Literal: function (node) {
      var token = context.getTokens(node)[0];

      if (token.type !== 'RegularExpression') {
        return;
      }

      if (!safe(token.value)) {
        context.report(node, 'possible unsafe regular expression');
      }
    }
  };
};
