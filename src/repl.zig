const std = @import("std");


fn parse(code: []u8) []u8 {
    return code;
}

fn eval(program: []u8) []u8 {
    return program;
}

pub fn loop() !void {
    const stdout = std.io.getStdOut().writer();

    var file = std.io.getStdIn();
    defer file.close();

    var buf: [1024]u8 = undefined;
    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();

    while(true) {
        while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
            var val = eval(parse(line));
            try stdout.print("{s}\n", .{val});
        }
    }
}

