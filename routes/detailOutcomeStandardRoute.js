const detailOutcomeStandard = require('../controllers/detailOutcomeStandardController');

module.exports = (app) => {
    // load detail của chuẩn đầu ra với id
    app.route('/getDetailOutcomeStandard/:idOutcomestandard').get();
    // lưu lại detail của chuẩn đầu ra với id
    app.route('/saveDetailOutcomeStandard/:idOutcomestandard').post();
    // add detail có idOutcomestandard (thường là add OutcomeStandard xong thì sẽ add detail)
    app.route('/addDetailOutcomeStandard/:idOutcomestandard').post();
}