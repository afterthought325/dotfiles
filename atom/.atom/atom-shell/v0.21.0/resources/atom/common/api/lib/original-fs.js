// Generated by CoffeeScript 1.7.1
(function() {
  var fn, source, vm;

  vm = require('vm');

  source = '(function (exports, require, module, __filename, __dirname) { ' + process.binding('natives').fs + '\n});';

  fn = vm.runInThisContext(source, {
    filename: 'fs.js'
  });

  fn(exports, require, module);

}).call(this);