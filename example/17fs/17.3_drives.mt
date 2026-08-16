Console.log("=== Fs 磁盘列表与磁盘信息（异步 Task.wait 模式）===");

function formatSize(bytes) {
    if (bytes == null) return "0 B";
    if (bytes < 0) bytes = 0;
    let units = ["B", "KB", "MB", "GB", "TB", "PB"];
    let i = 0;
    let size = bytes * 1.0;
    while (size >= 1024.0 && i < units.length - 1) {
        size = size / 1024.0;
        i++;
    }
    let scaled = Math.floor(size * 100) / 100;
    return scaled + " " + units[i];
}

function usedPercent(used, total) {
    let p;
    if (!total || total <= 0) return "0%";
    p = Math.floor(used * 10000.0 / total) / 100;
    return p + "%";
}

Console.log("\n--- 1. 异步获取全部磁盘 ---");
let diskTask = Fs.getDrives();
Task.wait(diskTask);
Console.log("getDrives 返回 code:", diskTask.code, ", msg:", diskTask.msg);
let drives = diskTask.data;
Console.log("检测到磁盘数量:", drives.length);
Console.log("完整列表:", drives);

Console.log("\n--- 2. 异步遍历每个磁盘的详细信息 ---");
let idx;
for (idx = 0; idx < drives.length; idx++) {
    let d = drives[idx];
    let infoTask = Fs.getDriveInfo(d);
    Task.wait(infoTask);
    if (infoTask.code != 0) {
        Console.log("[" + d + "] 获取失败 code=" + infoTask.code + ": " + (infoTask.msg || ""));
        continue;
    }
    let info = infoTask.data;
    if (!info) {
        Console.log("[" + d + "] 信息为空,跳过");
        continue;
    }
    let mark;
    if (info.ready) mark = "就绪"; else mark = "未就绪";
    let headLine = "[" + info.drive + "] " + mark +
                   "  类型: " + (info.type || "unknown");
    if (info.label) {
        headLine += "  卷标: " + info.label;
    }
    Console.log(headLine);

    if (info.ready) {
        let totalBytes;
        if (info.totalSize) totalBytes = info.totalSize; else totalBytes = 0;
        let fsVal = info.fileSystem; if (!fsVal) fsVal = "";
        let snVal = info.serialNumber; if (!snVal) snVal = "";
        let totalSizeFmt = formatSize(info.totalSize);
        let totalLine = "    总容量      : " + totalSizeFmt +
                        "  (" + totalBytes + " bytes)";
        let usedSizeFmt = formatSize(info.usedSize);
        let usedPct = usedPercent(info.usedSize, info.totalSize);
        let usedLine = "    已用空间    : " + usedSizeFmt + "  占比 " + usedPct;
        let freeSizeFmt = formatSize(info.freeSize);
        let availSizeFmt = formatSize(info.availableSize);
        Console.log("    文件系统    : " + fsVal);
        Console.log("    序列号      : " + snVal);
        Console.log(totalLine);
        Console.log(usedLine);
        Console.log("    可用空间    : " + freeSizeFmt);
        Console.log("    调用者可用  : " + availSizeFmt);
        let flags = [];
        if (info.readOnly)            flags.push("只读");
        if (info.supportsCompression) flags.push("压缩");
        if (info.supportsEncryption)  flags.push("加密");
        if (flags.length > 0) {
            Console.log("    特性        : " + flags.join(", "));
        }
    }
    Console.log("");
}

Console.log("--- 3. 单独查询示例 ---");
let target = null;
let i;
let infoTask2;
for (i = 0; i < drives.length; i++) {
    infoTask2 = Fs.getDriveInfo(drives[i]);
    Task.wait(infoTask2);
    if (infoTask2.code == 0 && infoTask2.data && infoTask2.data.ready) { target = drives[i]; break; }
}
if (!target && drives.length > 0) target = drives[0];

if (target) {
    Console.log("单独查询 " + target + ":");
    let singleTask = Fs.getDriveInfo(target);
    Task.wait(singleTask);
    Console.log("  code:", singleTask.code);
    Console.log("  msg :", singleTask.msg);
    Console.log("  data:", singleTask.data);
} else {
    Console.log("未检测到任何可用磁盘");
}

Console.log("\n=== 磁盘例程结束 ===");
