const request = require('request-promise');

const options = {
    method: 'POST',
    uri: 'http://10.70.51.243:8080/job/DropAP_Android/build',
    auth: {
        user: 'gocd',
        pass: '1706f187577b6cb1efb68b22c32938a9'
    },
    headers: {
        'Jenkins-Crumb': '3f33aa35e77cbc14bd3f91ccd6de742b'
    },
    qs: {
        token: 'TRIGGER_BY_GOCD'
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