'use strict';

const request = require('request-promise');
const args = require('./args').args;

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
        showMsgOfServiceError(err);
        showStatusOf(err.response);
        process.exit(1);
    });

function showMsgOfServiceError(error) {
    if (!error) return;
    if (!error.message) return;
    console.log(error.message);
}

function showStatusOf(response) {
    if (!response) return;
    console.log('status code: ' + response.statusCode);
    console.log('status message: ' + response.statusMessage);
}