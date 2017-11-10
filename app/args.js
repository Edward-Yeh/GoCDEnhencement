'use strict';

const args = require('yargs').argv;

if (!args.uri) {
    console.log('[ERROR] URL of Jenkins Web API is missing');
    process.exit(1);
}

if (!args.user) {
    console.log('[ERROR] User is missing!');
    process.exit(1);
}

if (!args.password) {
    console.log('[ERROR] Password is missing!');
    process.exit(1);
}

if (!args.crumb) {
    console.log('[ERROR] Jenkins Crumb is missing');
    process.exit(1);
}

module.exports = {
    args: args
};