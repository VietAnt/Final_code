
//Khoi_Tao_Thuoc_Tinh
const Book = function(book){
    this.id = book.id;
    this.name = book.name;
}

//Phuong_Thuc_Xu_Ly
Book.get_all = function(result){
    var data = [
        {"id": 1, "name": "Book Name 1"},
        {"id": 2, "name": "Book Name 2"},
        {"id": 3, "name": "Book Name 3"},
        {"id": 4, "name": "Book Name 4"},
        {"id": 5, "name": "Book Name 5"},
    ];

    result(data);
}


Book.getById = function(id){
   var data = {"id":id, "name": "Book Name 1"};
   return data;
}

module.exports = Book;