const repl = @import("repl");

pub fn main() anyerror!void {
    try repl.loop();
}

