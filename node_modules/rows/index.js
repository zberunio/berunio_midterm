#!/usr/bin/env node

var csv = require('csv')
  , vm = require('vm')
  , cmd = process.argv[2]
  , rows = []
csv()
  .from.stream(process.stdin)
  .on('record', function(row, index){
    rows.push(row.map(function(d){ return +d }))
  })
  .on('end', function(){
    console.log(vm.runInNewContext(cmd, {rows: rows}))
  })