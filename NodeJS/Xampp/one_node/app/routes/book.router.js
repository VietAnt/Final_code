

module.exports = function(router){
    var bookController = require('../controllers/book.controller');

//GET
router.get("/book/list", bookController.get_list);

router.get('/book/detail/:id', bookController.detail);

}