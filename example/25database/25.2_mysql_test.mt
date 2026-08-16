Console.log("=== MySQL 数据库异步测试 ===");

var mysqlHost = "localhost:3306";
var mysqlDb = "svg6";
var mysqlUser = "root";
var mysqlPwd = "root";

Console.log("\n--- 1. 连接 MySQL 数据库 ---");
var db = Db.openMysql(mysqlHost, mysqlDb, mysqlUser, mysqlPwd);
if (db == null) {
    Console.log("连接 MySQL 数据库失败");
} else {
    Console.log("连接成功");
    Console.log("驱动类型:", db.driver);
    Console.log("连接状态:", db.connected);
    Console.log("路径:", db.path);

    Console.log("\n--- 2. 创建测试表 ---");
    var dropHandler = db.execute("DROP TABLE IF EXISTS users");
    Task.wait(dropHandler);
    var createHandler = db.execute("CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100) NOT NULL, email VARCHAR(200), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
    Task.wait(createHandler);
    Console.log("建表结果 code:", createHandler.code, createHandler.msg);

    Console.log("\n--- 3. 插入测试数据 ---");
    var insertHandler = db.execute("INSERT INTO users (name, email) VALUES ('Alice', 'alice@test.com'), ('Bob', 'bob@test.com'), ('Charlie', 'charlie@test.com')");
    Task.wait(insertHandler);
    if (insertHandler.code != 0) {
        Console.log("插入失败:", insertHandler.msg);
    } else {
        Console.log("插入成功, 影响行数:", insertHandler.data);
    }

    Console.log("\n--- 4. 查询全部用户 ---");
    var queryHandler = db.query("SELECT id, name, email, created_at FROM users");
    Task.wait(queryHandler);
    if (queryHandler.code != 0) {
        Console.log("查询失败:", queryHandler.msg);
    } else {
        Console.log("查询成功, 共", queryHandler.data.length, "条记录:");
        var rows = queryHandler.data;
        for (var r1 = 0; r1 < rows.length; r1++) {
            Console.log("  id=", rows[r1].id, "name=", rows[r1].name, "email=", rows[r1].email);
        }
    }

    Console.log("\n--- 5. 条件查询 ---");
    var query2Handler = db.query("SELECT id, name, email FROM users WHERE id = 1");
    Task.wait(query2Handler);
    if (query2Handler.code != 0) {
        Console.log("查询失败:", query2Handler.msg);
    } else {
        Console.log("条件查询结果, 共", query2Handler.data.length, "条记录:");
        var rows2 = query2Handler.data;
        for (var r2 = 0; r2 < rows2.length; r2++) {
            Console.log("  id=", rows2[r2].id, "name=", rows2[r2].name);
        }
    }

    Console.log("\n--- 6. 更新数据 ---");
    var updateHandler = db.execute("UPDATE users SET email = 'alice_new@test.com' WHERE name = 'Alice'");
    Task.wait(updateHandler);
    if (updateHandler.code != 0) {
        Console.log("更新失败:", updateHandler.msg);
    } else {
        Console.log("更新成功, 影响行数:", updateHandler.data);
    }

    Console.log("\n--- 7. 查询更新后的数据 ---");
    var query3Handler = db.query("SELECT id, name, email FROM users WHERE name = 'Alice'");
    Task.wait(query3Handler);
    if (query3Handler.code != 0) {
        Console.log("查询失败:", query3Handler.msg);
    } else {
        var rows3 = query3Handler.data;
        for (var r3 = 0; r3 < rows3.length; r3++) {
            Console.log("  id=", rows3[r3].id, "name=", rows3[r3].name, "email=", rows3[r3].email);
        }
    }

    Console.log("\n--- 8. 删除测试数据 ---");
    var deleteHandler = db.execute("DELETE FROM users WHERE name IN ('Alice', 'Bob', 'Charlie')");
    Task.wait(deleteHandler);
    if (deleteHandler.code != 0) {
        Console.log("删除失败:", deleteHandler.msg);
    } else {
        Console.log("删除成功, 影响行数:", deleteHandler.data);
    }

    Console.log("\n--- 9. 并发查询测试 ---");
    var h1 = db.query("SELECT COUNT(*) as cnt FROM users");
    var h2 = db.query("SELECT 1 as test_val");
    Task.wait(h1);
    Console.log("并发查询1 结果: code=", h1.code);
    Task.wait(h2);
    Console.log("并发查询2 结果: code=", h2.code);

    Console.log("\n--- 10. 关闭数据库 ---");
    var closeHandler = db.close();
    Task.wait(closeHandler);
    Console.log("关闭结果 code:", closeHandler.code, closeHandler.msg);
}

Console.log("\n=== 所有 MySQL Db 测试完成 ===");

Console.log("\n--- 重新连接并插入样本数据留在库中查看 ---");
var db2 = Db.openMysql(mysqlHost, mysqlDb, mysqlUser, mysqlPwd);
if (db2 != null) {
    var ins = db2.execute("INSERT INTO users (name, email) VALUES ('Alice', 'alice@test.com'), ('Bob', 'bob@test.com'), ('Charlie', 'charlie@test.com')");
    Task.wait(ins);
    if (ins.code == 0) Console.log("样本数据已插入库中, 共影响", ins.data, "行, 请在 Navicat 刷新查看");
    var cl = db2.close();
    Task.wait(cl);
}
