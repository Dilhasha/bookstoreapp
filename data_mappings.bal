function createIsbnLookupReq(BookData req) returns IsbnLookupReq => {
    title: req.title,
    author: req.author
,
    edition: req.edition
};

function createBookRes(string status, string isbn) returns CreateBookRes => {
    isbn: isbn,
    status: status
};
