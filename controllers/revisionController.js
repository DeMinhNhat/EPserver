const revision = require('../service/revisionService');

exports.getRevision = (req, res) => {
    let body = req.query;
    let request = {};
    request.IdOutcomeStandard = Number(body.idoutcome);
    revision.getRevision(request)
        .then(data => {
            let response = {};
            response.data = data;
            res.send(JSON.stringify(response));
        })
}

exports.addRevision = (req, res) => {
    let params = req.query;
    let request = {};
    request.IdOutcomeStandard = params.idoutcome;
    request.IdUser = params.iduser;
    request.NameRevision = params.name;
    request.DateUpdated = params.dateupdated;

    revision.addRevision(request)
        .then(data => {
            let response = {};
            if (data === 1) {
                response.code = 1;
                response.message = "success";
                res.send(JSON.stringify(response));
            } else if (data === -2) {
                response.code = -2;
                response.message = "couldn't find id outcome standard";
                res.send(JSON.stringify(response));
            }
            else {
                response.code = -1;
                response.message = "fail";
                res.send(JSON.stringify(response));
            }
        })
}