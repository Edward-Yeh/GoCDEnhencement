'use strict';

const request = require('request-promise');
const args = require('./app/args.js').args;

const options = {
    method: 'POST',
    uri: args.uri,
    auth: {
        user: args.user,
        pass: args.password
    },
    headers: {
        'Jenkins-Crumb': args.crumb
    },
    qs: {
        token: !args.token ? 'TRIGGER_BY_GOCD' : args.token
    },
    resolveWithFullResponse: true,
    json: true
};


request(options)
    .then(function (response) {
        showStatusOf(response);
    })
    .catch(function (err) {
        console.log('[ERROR] Fail to trigger Build task');
        showStatusOf(err.response);
        process.exit(1);
    });

function showStatusOf(response) {
    if (!response) return;
    console.log('status code: ' + response.statusCode);
    console.log('status message: ' + response.statusMessage);
}