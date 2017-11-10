'use strict';

const args = require('yargs').argv;
const request = require('request-promise');

if (!args.uri) {
    console.log('[ERROR] Missing the URL of Jenkins Web API');
    process.exit(1);
}

if (!args.user) {
    console.log('[ERROR] Missing the user');
    process.exit(1);
}

if (!args.password) {
    console.log('[ERROR] Missing the password');
    process.exit(1);
}

if (!args.crumb) {
    console.log('[ERROR] Missing Jenkins Crumb');
    process.exit(1);
}

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