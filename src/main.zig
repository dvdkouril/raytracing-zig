const std = @import("std");

const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,

    pub fn init(x: f32, y: f32, z: f32) Vec3 {
        return Vec3 {
            .x = x,
            .y = y,
            .z = z,
        };
    }

    pub fn dot(self: Vec3, other: Vec3) f32 {
        return self.x * other.x + self.y * other.y + self.z * other.z;
    }
}

pub fn main() !void {
    std.debug.print("hey.", .{});

    const image_width = 512;
    const image_height = 512;
    // const image_width = 5;
    // const image_height = 5;

    const v1 = Vec3.init(1.0, 0.0, 0.0);
    const v2 = Vec3.init(0.0, 1.0, 0.0);
    const a = v1.dot(v20);
    const b = Vec3.dot(v1, v2);

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("P3\n{} {}\n255\n", .{ image_width, image_height });

    for (0..image_height) |j| {
        for (0..image_width) |i| {
            const r: f32 = @as(f32, @floatFromInt(i)) / (image_width - 1);
            const g: f32 = @as(f32, @floatFromInt(j)) / (image_height - 1);
            // const r: f32 = @floatFromInt(i) / (image_width - 1);
            // const g: f32 = @floatFromInt(j) / (image_height - 1);
            const b = 0;

            const outR: u32 = @intFromFloat(r * 255);
            const outG: u32 = @intFromFloat(g * 255);
            const outB: u32 = @intFromFloat(b * 255);
            // const outR = 125;
            // const outG = 125;
            // const outB = 125;

            std.debug.print("{},{}\n", .{ i, j });

            try stdout.print("{} {} {}\n", .{ outR, outG, outB });
        }
    }

    try bw.flush();
}

// pub fn main() !void {
//     // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
//     std.debug.print("All your {s} are belong to us.\n", .{"codebase"});
//
//     // stdout is for the actual output of your application, for example if you
//     // are implementing gzip, then only the compressed bytes should be sent to
//     // stdout, not any debugging messages.
//     const stdout_file = std.io.getStdOut().writer();
//     var bw = std.io.bufferedWriter(stdout_file);
//     const stdout = bw.writer();
//
//     try stdout.print("Run `zig build test` to run the tests.\n", .{});
//
//     try bw.flush(); // don't forget to flush!
// }

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
