var safe = require('safe-regex');

module.exports = function(context) {
  'use strict';

  return {
    'Literal': function(node) {
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
