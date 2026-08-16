Console.log("=== Db 数据库异步测试 ===");

let dbPath = "test.s3db";

Console.log("\n--- 1. 连接数据库 ---");
let database = Db.openSqlite(dbPath);
if (database == null) {
    Console.log("连接数据库失败");
} else {
    Console.log("连接成功");
    Console.log("驱动类型:", database.driver);
    Console.log("连接状态:", database.connected);
    Console.log("路径:", database.path);

    

    Console.log("\n--- 1. 查询全部用户 ---");
    let queryTask = database.query("SELECT id, name, tel FROM user");
    Task.wait(queryTask);
    if (queryTask.code != 0) {
        Console.log("查询失败:", queryTask.msg);
    } else {
        Console.log("查询成功, 共", queryTask.data.length, "条记录:");
        let rows = queryTask.data;
        for (let i = 0; i < rows.length; i++) {
            Console.log("  id=", rows[i].id, "name=", rows[i].name, "tel=", rows[i].tel);
        }
    }

    Console.log("\n--- 2. 并发查询测试（按序串行执行）---");
    let q1Task = database.query("SELECT * FROM user WHERE id = 1");
    let q2Task = database.query("SELECT * FROM user WHERE id = 2");
    Task.wait(q1Task);
    Console.log("并发查询1 结果:", q1Task.code, q1Task.data);
    Task.wait(q2Task);
    Console.log("并发查询2 结果:", q2Task.code, q2Task.data);

  
    Console.log("\n--- 3. 关闭数据库 ---");
    let closeTask = database.close();
    Task.wait(closeTask);
    Console.log("关闭结果 code:", closeTask.code, closeTask.msg);
}

Console.log("\n=== 所有 Db 测试完成 ===");