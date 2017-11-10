const request = require('request-promise');

const options = {
    method: 'POST',
    uri: 'http://gocd:1706f187577b6cb1efb68b22c32938a9@10.70.51.243:8080/job/DropAP_Android/build',
    qs: {
        token: 'TRIGGER_BY_GOCD'
    },
    headers: {
        'Jenkins-Crumb': '3f33aa35e77cbc14bd3f91ccd6de742b'
    }
};

request(options)
    .then(function (response) {
        console.log('Success');
    })
    .catch(function (err) {
        console.log(err);
    });