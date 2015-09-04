
 //Definition for a binary tree node.
#include <climits>
#include <stddef.h>
#include <iostream>
using namespace std;


struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
  TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};
 
bool help(TreeNode* root, int min, int max);

bool isValidBST(TreeNode* root) {
    if (root==NULL) return true;
    return help(root, INT_MIN, INT_MAX);
}

bool help(TreeNode* root, int min, int max){
    if (root == NULL) return true;
    bool b = root->val >= max ;
    cout<<"root->val is "<<root->val<<" max is "<<max<<" and are they >=? "<< b<<endl;
    if (root->val <= min || root->val >= max){
        cout<<"here we go"<<endl;
        return false;
    }
    if (root->left) {
        cout<<"here in the left and the new max is "<<root->val<<endl;
        return help(root->left, min, root->val);
    }
    if (root->right) {
        return help(root->right,root->val,max);
    }
    return false;
}


int main()
{
    TreeNode a = TreeNode(1);
    TreeNode b = TreeNode(1);
    a.left = &b;
    cout<<isValidBST(&a)<<endl;
    return 0;
}










