const eduprogram = require('../../service/EducationProgram/eduprogramService');

exports.getEduProgList = (req, res) => {
    eduprogram.getEduProgram()
        .then(data => {
            let response = {};
            if (data) {
                response.code = 1;
                response.message = "success";
                response.data = data;
                res.send(JSON.stringify(response));
            } else {
                response.code = -1;
                response.message = "fail";
                response.data = data;
                res.send(JSON.stringify(response));
            }
        })
}

exports.getEduProgByID = (req, res) => {
    let params = req.query;
    let request = {};
    request.Id = Number(params.ideduprog);
    eduprogram.getEduProgramById(request)
        .then(data => {
            let response = {};
            if (data) {
                response.code = 1;
                response.message = "success";
                response.data = data;
                res.send(JSON.stringify(response));
            } else {
                response.code = -1;
                response.message = "fail";
                response.data = data;
                res.send(JSON.stringify(response));
            }
        })
}

exports.addEduProgram = (req, res) => {
    let body = JSON.parse(req.body.data);
    let request = {};
    request.EduName = body.eduname;
    request.EduEngName = body.eduengname;
    request.IdLevel = Number(body.idlevel);
    request.IdMajor = Number(body.idmajor);
    request.IdProgram = Number(body.idprogram);
    request.SchoolYear = body.schoolyear;
    request.DateCreated = body.datecreated;
    request.DateEdited = body.dateedited;

    eduprogram.addEduProgram(request)
        .then(data => {
            let response = {};
            if (data === 1) {
                response.code = 1;
                response.message = "add success";
                res.send(JSON.stringify(response));
            } else {
                response.code = -1;
                response.message = "add fail";
                res.send(JSON.stringify(response));
            }
        })
        .catch(err => {
            throw err;
        })
}