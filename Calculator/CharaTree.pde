class CharaTree
{

  Chara divide = new Chara("divide");
  Chara add = new Chara("+");
  Chara subtract = new Chara("-");
  Chara zero= new Chara("0");
  Chara one= new Chara("1");
  Chara two= new Chara("2");
  Chara three= new Chara("3");
  Chara four= new Chara("4");
  Chara five= new Chara("5");
  Chara six= new Chara("6");
  Chara seven= new Chara("7");
  Chara eight= new Chara("8");
  Chara nine= new Chara("9");


  Chara[] OPCHARAS = { divide, add, subtract};
  Chara[] NUMCHARAS = {zero, one, two, three, four, five, six, seven, eight, nine};
  TreeNode _root;

  CharaTree()
  {
    _root = null;
  }



  void insert(Chara newVal)
  {
    TreeNode newNode = new TreeNode(newVal);

    if (_root == null)
    {
      _root = newNode;
      return;
    }

    insert(_root, newNode);
  }

  Chara times = new Chara("times");

  //returns if list contains an element
  boolean contains(Chara[] charaList, Chara chara)
  {
    for (Chara x : charaList)
    {
      if (x == chara)
        return true;
    }
    return false;
  }

  void insert (TreeNode stRoot, TreeNode newNode)
  {
    //if stRoot node contians operends
    if (contains(OPCHARAS, stRoot.getValue()))
    {
      //if inserting value contains numerals
      if (contains(NUMCHARAS, newNode.getValue())) 
      {
        if (stRoot.getLeft() == null) { //sets left node to newNode if empty 
          stRoot.setLeft(newNode);
        } else if (stRoot.getRight() == null ) { //sets right node to newNode if empty
          stRoot.setRight(newNode);
        } else { //else recurs down the right children
          insert(stRoot.getRight(), newNode);
        }
      } else if (contains(OPCHARAS, newNode.getValue()))
      {
        if (stRoot.getRight() == null ) { //sets right node to newNode if empty
          stRoot.setRight(newNode);
        } else { //else recurs down the right children
          insert(stRoot.getRight(), newNode);
        }
      }
    }
  }
}
