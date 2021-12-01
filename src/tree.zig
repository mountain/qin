const std = @import("std");

pub const Node = struct {
    left: ?*Node,
    right: ?*Node,

    /// parent | color
    parent_and_color: usize,
};

pub const Tree = struct {
    root: ?*Node,
    compareFn: fn (*Node, *Node) mem.Compare,

    pub fn insert(tree: *Tree, node_const: *Node) ?*Node {
        return null;
    }

    pub fn init(tree: *Tree, f: fn (*Node, *Node) mem.Compare) void {
        tree.root = null;
        tree.compareFn = f;
    }
};