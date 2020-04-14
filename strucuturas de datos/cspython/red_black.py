class TreeNode(object):
    def __init__(self,val):
        self.val = val
        self.left = None
        self.right = None
        self.height = 1

class AVL_Tree(object):
    def insert(self,root: TreeNode ,key: int) -> TreeNode:
        if not root:
            return TreeNode(key)
        elif key < root.val:
            root.left = self.insert(root.left, key)
        else: # key > root.val:
            root.right = self.insert(root.right, key)

        # update height
        root.height = 1 + max(self.getHeight(root.left),self.getHeight(root.right))
        balance = self.getBalance(root)

        # choose of 4 cases 
        # left left case
        if balance > 1 and key < root.left.val:
            return self.rotateRight(root)
        # case right right
        if balance < -1 and key > root.right.val:
            return self.rotateLeft(root)
        # case left right 
        if balance > 1 and key > root.left.val:
            root.left = self.rotateLeft(root.left)
            return self.rotateRight(root)
        if balance < -1 and key < root.right.val:
            root.right = self.rotateRight(root.right)
            return self.rotateLeft(root)
        # el arbol esta balanceado
        return root 
    def delete(self,root: TreeNode , key: int):
        """ delete node """
        if not root:
            return None
        elif key < root.val:
            root.left =self.delete(root.left, key)
        elif key > root.val:
            root.right = self.delete(root.right, key)
        else:
            if root.left is None:
                tmp = root.right
                root = None
                return tmp
            elif root.right is None:
                tmp = root.left
                root = None
                return tmp
            tmp = self.getMinValueNode(root.right)
            root.val = tmp.val
            root.right = self.delete(root.right, tmp.val)
        if root is None:
            return root
        #update altura
        root.height = 1 + max(self.getHeight(root.left),self.getHeight(root.right))
        balance = self.getBalance(root)
        # tratando los cuatros casos
        # left left case
        if balance > 1 and self.getBalance(root.left) >= 0:
            return self.rotateRight(root)
        # case right right
        elif balance < -1 and self.getBalance(root.right) <= 0:
            return self.rotateLeft(root)
        # case left right 
        elif  balance > 1 and self.getBalance(root.left) < 0:
            root.left = self.rotateRight(root.left)
            return self.rotateRight(root)
        # case derecha izq
        elif balance < -1 and self.getBalance(root.right) > 0:
            root.right = self.rotateLeft(root.right)
            return self.rotateRight(root)
        # el arbol se mantuvo balanceado
        return root

    def rotateRight(self, z: TreeNode):
        y = z.left
        T3 = y.right 
        y.right = z
        z.left = T3
        z.height = 1 + max(self.getHeight(z.left),self.getHeight(z.right))
        y.height = 1 + max(self.getHeight(y.left), self.getHeight(y.right))
        # return new root
        return y

    def rotateLeft(self, z):
        y: TreeNode = z.right
        T3 = y.left
        y.left = z
        z.right = T3
        y.height = 1 + max(self.getHeight(y.left),self.getHeight(y.right))
        z.height = 1 + max(self.getHeight(z.left),self.getHeight(z.right))
        return y
    def getMinValueNode(self, root: TreeNode):
        current = root
        while current.left is not None:
            current = current.left
        return current
    
    def getHeight(self,root: TreeNode)-> int:
        if not root:
            return 0
        return root.height
    def getBalance(self,root: TreeNode)-> int:
        if not root:
            return 0
        return self.getHeight(root.left) - self.getHeight(root.right)
    def preOrder(self,root):
        if not root:
            return
        print(f"({root.val})->",end="")
        self.preOrder(root.left)
        self.preOrder(root.right)

myTree = AVL_Tree() 
root = None
nums = [9, 5, 10, 0, 6, 11, -1, 1, 2] 
  
for num in nums: 
    root = myTree.insert(root, num) 
  
# Preorder Traversal 
print("Preorder Traversal after insertion -") 
myTree.preOrder(root) 
print() 
  
# Delete 
key = 10
root = myTree.delete(root, key) 
  
# Preorder Traversal 
print("Preorder Traversal after deletion -") 
myTree.preOrder(root) 
print() 
