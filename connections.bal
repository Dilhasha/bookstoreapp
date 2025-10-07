import ballerinax/mysql;
import ballerinax/mysql.driver as _;

final mysql:Client bookStoreDbClient = check new (host, user, password, database, port);
