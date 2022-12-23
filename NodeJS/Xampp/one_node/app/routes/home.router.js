

module.exports = function(router){
    var homeController = require('../controllers/home.controller');

//GET
router.get("/", homeController.home);

router.get('/about', homeController.about);

}