'use strict';

let co = require('co');
let putil = require('promised-util');

let betolerant = function(tries, timeout, fn) {
    return putil.timeout(timeout, co(fn)).catch(function(error) {
        if (tries !== 1) {
            return betolerant(tries - 1, timeout, fn);
        }
        throw error;
    });
};

module.exports = betolerant;
