const std = @import("std");
const Builder = std.build.Builder;
const Package = std.build.Pkg;
const builtin = @import("builtin");


pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("qi", "src/qi.zig");

    exe.setBuildMode(mode);
    exe.addPackagePath("parser", "src/parser.zig");
    exe.addPackagePath("repl", "src/repl.zig");
    exe.linkSystemLibrary("c");
    const run_cmd = exe.run();

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
