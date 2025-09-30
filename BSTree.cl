class TreeNode {
    val: Int;
    left: TreeNode;
    right: TreeNode;

    init(v: Int) : TreeNode {
        {
            val <- v;
            left <- null;
            right <- null;
            self;
        }
    };
};

class BST {
    root: TreeNode;

    init() : BST {
        {
            root <- null;
            self;
        }
    };

    insert(v: Int) : Object {
        let new_node: TreeNode <- (new TreeNode).init(v) in
        if root = null then
            root <- new_node
        else
            insert_helper(root, new_node)
        fi
    };

    insert_helper(current: TreeNode, new_node: TreeNode) : Object {
        if new_node.val < current.val then
            if current.left = null then
                current.left <- new_node
            else
                insert_helper(current.left, new_node)
            fi
        else if new_node.val > current.val then
            if current.right = null then
                current.right <- new_node
            else
                insert_helper(current.right, new_node)
            fi
        else
            -- 重复值不插入，此处可根据需求处理（如报错）
            out_string(io, "Error: Duplicate value ");
            out_int(io, new_node.val);
            out_string(io, " not inserted.\n")
        fi fi
    };

    search(v: Int) : Bool {
        search_helper(root, v)
    };

    search_helper(current: TreeNode, v: Int) : Bool {
        if current = null then
            false
        else if v = current.val then
            true
        else if v < current.val then
            search_helper(current.left, v)
        else
            search_helper(current.right, v)
        fi fi fi
    };

    printInOrder() : Object {
        printInOrderHelper(root)
    };

    printInOrderHelper(current: TreeNode) : Object {
        if current != null then
            {
                printInOrderHelper(current.left);
                out_int(io, current.val);
                out_string(io, " ");
                printInOrderHelper(current.right);
            }
        else
            ""  -- 空操作，满足语法要求
        fi
    };
};

class Main {
    main() : Object {
        let bst: BST <- (new BST).init() in
        {
            bst.insert(5);
            bst.insert(3);
            bst.insert(7);
            bst.insert(2);
            bst.insert(4);
            bst.insert(6);
            bst.insert(8);

            out_string(io, "In-order traversal: ");
            bst.printInOrder();
            out_string(io, "\n");

            out_string(io, "Search 4: ");
            out_bool(io, bst.search(4));
            out_string(io, "\n");

            out_string(io, "Search 9: ");
            out_bool(io, bst.search(9));
            out_string(io, "\n");

            -- 测试重复值插入
            bst.insert(5);
            self;
        }
    };
};