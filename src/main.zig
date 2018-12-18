const std = @import("std");

pub fn main() anyerror!void {
    std.debug.warn("All your base are belong to us.\n");
}

const Template = struct {

    // Call is a callback function. Users may provide this to extend the Value
    // abstraction
    //
    // Be aware that it is up to the implementor to manage any resources like
    // memory allocation that happen within the function.
    const Call = struct {
        func: fn (self: *Call) !Value,
    };

    pub const ObjectMap = HashMap([]const u8, Value, mem.hash_slice_u8, mem.eql_slice_u8);
    pub const Value = union(enum) {
        Null,
        Bool: bool,
        Integer: i64,
        Float: f64,
        String: []const u8,
        Array: ArrayList(Value),
        Object: ObjectMap,
        FnCall: *Call,
    };
};
