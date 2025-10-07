import ballerina/http;
import ballerina/sql;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {

    resource function put book(@http:Payload BookData payload) returns error|CreateBookRes {
        do {
            CreateBookRes bookRes = createBookRes("success", "12345678900");
            return bookRes;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    resource function get book/[string author]/[string title]() returns error|BookData[] {
        do {
            sql:ParameterizedQuery query = `SELECT * FROM books WHERE author = ${author} AND title = ${title}`;

            stream<BookData, sql:Error?> bookStream = bookStoreDbClient->query(query);

            BookData[] books = [];
            check from BookData book in bookStream
                do {
                    books.push(book);
                };

            return books;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }
}
