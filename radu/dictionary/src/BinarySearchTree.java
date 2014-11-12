
public class BinarySearchTree {

    TreeNodes root = null;
    TreeNodes parent = null;
    TreeNodes lefty = null;
    TreeNodes righty = null;

    public BinarySearchTree() {
        root = new TreeNodes();
        root.set_left(null);
        root.set_right(null);
        root.set_parent(null);
    }

    public TreeNodes find(String word) {
        if (root.get_entry().type() == -1) {
            //empty tree
            return null;
        }
        if (root.get_entry().word().equalsIgnoreCase(word)) {
            return root;
        } else {
            TreeNodes search = root;
            //TreeNodes search_parent = root;

            while (!search.get_entry().word().equalsIgnoreCase(word)) {
                //search_parent = search;

                // if search is not a leaf it has children 
                if (search.get_entry().word().compareTo(word) > 0) {
                    search = search.get_left();
                } else {
                    search = search.get_right();
                }

                if (search.get_entry().type() == -1) {
                    return null;
                } else if (search.get_entry().word().equalsIgnoreCase(word)) {
                    return search;
                }
            }
            return null;
        }
    }

    public TreeNodes[] find1(String word){
		
		if (root.get_entry().word() == word){
			TreeNodes[] a = {root, null};
			return a;
		} else {
			TreeNodes search = root;
			TreeNodes search_parent = root;
			TreeNodes[] a = {search, search_parent};
			while(search.get_entry().word() != word){
				if (search.get_entry().word().compareTo(word) > 0){
					search_parent = search;
					search = search.get_left();
					if (search.get_entry().word() == word){
						return a;
					} else if (search.get_entry().type() == -1){
						return null;
					}
				} else {
					search_parent = search;
					search = search.get_right();
					if (search.get_entry().word() == word){
						return a;
					} else if (search.get_entry().type() == -1){
						return null;
			     	}
			    }
		    }
			return null;
	    }
	}

    
    public int insert(DictEntry entry) {

        if (find(entry.word()) == null) {

            //If root is leaf, set root to entry return 1 (successful input)

            if (root.get_entry().type() == -1) {
                root.set_entry(entry);
                root.set_left(new TreeNodes());
                root.set_right(new TreeNodes());
                return 1;

                //Else if entry if not a leaf, and if the left child is alphabetically less than the entry key or the right child is less than the entry key{
                //If the entry key is alphabetically less than the current search then entry should be one of search's left children, so search becomes its left child and loop continues
                //Else if the entry key is greater than current search, then entry should be one of search's right children
                //While loop terminates when a leaf is reached and search isn't less than left child or greater than right child, so entry must go where search is

            } else {
                TreeNodes search = root;
                TreeNodes search_parent = root;
                while ((search.get_entry().type() != -1) && (search.get_left().get_entry().word().compareTo(entry.word()) > 0 || search.get_right().get_entry().word().compareTo(entry.word()) < 0)) {
                    if (search.get_entry().word().compareTo(entry.word()) > 0) {
                        search_parent = search;
                        search = search.get_left();
                    } else if (search.get_entry().word().compareTo(entry.word()) < 0) {
                        search_parent = search;
                        search = search.get_right();
                    }
                }

                //If search is a leaf, then just set leaf to the entry, and set it's parent and create two leaf children, return 1

                if (search.get_entry().type() == -1) {
                    search.set_entry(entry);
                    //search.set_parent(search_parent);  // @@remove i already know who my parent is 
                    search.set_left(new TreeNodes());
                    search.set_right(new TreeNodes());
                    return 1;

                    //The entry key could be either less than or greater than the search, but we don't know which, so we have to check	
                    //Else if search is a node with two leaf children, check if entry should become left or right child of search and return 1
                    

                } else if (search.get_left().get_entry().type() == -1 && search.get_right().get_entry().type() == -1) {
                    if (search.get_entry().word().compareTo(entry.word()) > 0) {   //If entry key is alphabetically before search
                        search.get_left().set_entry(entry);			   //Then entry should be search's left child
                        //search.get_left().set_parent(search);          //Set search to be it's left child's parent
                        search.get_left().set_left(new TreeNodes());   //Left child gets two leaf children
                        search.get_left().set_right(new TreeNodes());
                        return 1;
                    } else {											//Else entry is greater than search and should be the right child
                        search.get_right().set_entry(entry);
                        //search.get_right().set_parent(search);          //Set search to be it's right child's parent
                        search.get_right().set_left(new TreeNodes());   //right child gets two leaf children
                        search.get_right().set_right(new TreeNodes());
                        return 1;
                    }

                    //Else if search is a node with left child being leaf (if true, right child can't be leaf because of above else if)	
                    //Entry must be less than search's right child	
                    //Check if entry key is less than search, if it is, set entry to search's left child
                    //Otherwise	set it as the parent of the right child of search, and then itself as search's new right child

                } else if (search.get_left().get_entry().type() == -1) {
                    if (search.get_entry().word().compareTo(entry.word()) > 0) {          //If less than search, set search's left leaf to entry
                        search.get_left().set_entry(entry);								 //Set parent, and two left and right leaf nodes
                        search.get_left().set_parent(search);
                        search.get_left().set_left(new TreeNodes());
                        search.get_left().set_right(new TreeNodes());
                        return 1;
                    } else {
                        TreeNodes inserting = new TreeNodes();							//Else create new  node, make node's left child a leaf
                        inserting.set_parent(search);									//And right child as search's former right child
                        inserting.set_left(new TreeNodes());
                        inserting.set_right(search.get_right());
                        inserting.set_entry(entry);
                        search.set_right(inserting);									//Make search's new right child = to new node
                        inserting.get_right().set_parent(inserting);					//Let new node's right child know that it has a new parent
                        return 1;
                    }

                    //Same thing but if search's right child is leaf	

                } else if (search.get_right().get_entry().type() == -1) {

                    if (search.get_entry().word().compareTo(entry.word()) < 0) {           //Entry key is alphabetically greater than search
                        search.get_right().set_entry(entry);
                        search.get_right().set_parent(search);
                        search.get_right().set_left(new TreeNodes());
                        search.get_right().set_right(new TreeNodes());
                        return 1;
                    } else {															//Create new node, make node
                        TreeNodes inserting = new TreeNodes();
                        inserting.set_parent(search);
                        inserting.set_right(new TreeNodes());
                        inserting.set_left(search.get_left());
                        inserting.set_entry(entry);
                        search.set_left(search);
                        inserting.get_left().set_parent(inserting);
                        return 1;
                    }

                    //Finally, in the last case, search has two internal node children and entry should be its left or right child because
                    //The entry key is not less than search's left child key and not greater than search's right child key

                } else {
                    TreeNodes inserting = new TreeNodes();
                    inserting.set_parent(search);
                    inserting.set_entry(entry);

                    if (search.get_entry().word().compareTo(entry.word()) > 0) {      //Alphabetically less than
                        inserting.set_left(search.get_left());
                        inserting.set_right(new TreeNodes());
                        inserting.get_left().set_parent(inserting);
                        return 1;
                    } else {
                        inserting.set_right(search.get_right());
                        inserting.set_left(new TreeNodes());
                        inserting.get_right().set_parent(inserting);
                        return 1;
                    }
                }
            }

        } else {
            return -1;
        }
    }

    public int remove(String word) {
        
         TreeNodes found = find(word);
         
        if (found == null) {			//key is not in tree, has to generate exception
            return -1;
        } else {
            //check if 'found' is 'root'
            TreeNodes parent = found.get_parent();
            if (found.get_parent() == null){
            //if (root.get_entry().word() == word && root.get_left().get_entry().type() == -1 && root.get_left().get_entry().type() == -1) {
                root.set_left(null);
                root.set_right(null);
                root = new TreeNodes();///??????
                return 1;
            } else {
                         
                // If the entry to be removed has two leaf children, set parent's correct child to be a leaf, then remove children of node, then node
                if (found.get_left().get_entry().type() == -1 && found.get_right().get_entry().type() == -1) {
                    if (found == parent.get_left()) {
                        parent.set_left(new TreeNodes());
                    } else {
                        parent.set_right(new TreeNodes());
                    }

                    found.set_left(null);
                    found.set_right(null);
                    //found = null; //parent has to have a child leaf new TreeNodes()
                    return 1;

                    //Else if entry to be removed has left child as leaf, find if entry is left or right child of parent, set new left or right child of parent to be right child of
                    //the entry. Set new child's parent to be parent of entry. Then remove entry's left child and entry

                } else if (found.get_left().get_entry().type() == -1) {
                    if (parent.get_left() == found) {
                        parent.set_left(found.get_right());
                        parent.get_right().set_parent(parent);
                    } else {
                        parent.set_right(found.get_right());
                        parent.get_right().set_parent(parent);
                    }
                    found.set_left(null);
                    found= null;
                    return 1;

                    //Repeat above if the entry to be removed has right child as leaf

                } else if (found.get_right().get_entry().type() == -1) {
                    if (parent.get_left() == found) {
                        parent.set_left(found.get_left());
                        parent.get_left().set_parent(parent);
                    } else {
                        parent.set_right(found.get_left());
                        parent.get_right().set_parent(parent);
                    }
                    found.set_right(null);
                    found = null;
                    return 1;

                    //Final case is if entry to be removed has no leaf children. In which case, loop until right most child of entry's left sub-tree is found, along with
                    //its parent. Set new right child of said parent to be left subtree of original child, which is either an internal node, or a leaf.
                    //Then set the found child's right child to be right child of entry to be removed, its parent the parent of the entry to be removed, and its left child
                    //to be either leaf (if it was an only child) or the left subtree of the entry. Finally, remove the entry.	

                } else {
                    TreeNodes LTSR = found.get_left();       //Name means "Left then stick right"
                    TreeNodes parentq = found;

                    while (LTSR.get_right().get_entry().type() != -1) {      //Search for right most child (LTSR) in left subtree
                        parentq = LTSR;
                        LTSR = LTSR.get_right();
                    }
                    parentq.set_right(LTSR.get_left());						//Replace right child of the parent of LTSR with left subtree of LTSR
                    parentq.get_right().set_parent(parentq);					//Make former left child of LTSR have parent LTSR once did
                    //Effectively removing LTSR from its place in the tree
                    LTSR.set_parent(parent);
                    if (parent.get_left() == found) {					//Replace parent of LTSR with parent of entry to be removed
                        parent.set_left(LTSR);							//Check if entry is a left or right child, and set new left or right child to be LTSR
                    } else {
                        parent.set_right(LTSR);
                    }

                    LTSR.set_right(found.get_right());					//Set untouched right subtree of entry to be removed to be LTSR's right subtree
                    if (found.get_left().get_left().get_entry().type() == -1) {	//Appropriately assign left child of LTSR (if LTSR is only descendant = left child is leaf node
                        LTSR.set_left(new TreeNodes());								//If not, then LTSR's left child is the left child of entry to be removed
                    } else {
                        LTSR.set_left(found.get_left());							//By now, LTSR has completely taken the entry's spot in the tree
                    }
                    found = null;												//So we can safely remove it and return a successful removal
                    return 1;
                }

            }
        }
    }

    public String successor(String word) {
        TreeNodes it = root;
        TreeNodes right_child = root.get_right();

        while (333 == 333) {
            if (it.get_entry().word().compareTo(word) <= 0 && right_child.get_entry().word().compareTo(word) > 0) {
                break;
            } else if (right_child.get_entry().word().compareTo(word) < 0) {
                if (right_child.get_entry().type() == -1) {
                    break;
                }
                it = right_child;
                right_child = right_child.get_right();
            }
        }
        return right_child.get_entry().word();
    }

    public String predecessor(String word) {
        TreeNodes it = root;
        TreeNodes left_child = root.get_left();

        while (333 == 333) {
            if (it.get_entry().word().compareTo(word) >= 0 && left_child.get_entry().word().compareTo(word) < 0) {
                break;
            } else if (left_child.get_entry().word().compareTo(word) > 0) {
                if (left_child.get_entry().type() == -1) {
                    break;
                }
                it = left_child;
                left_child = left_child.get_left();
            }
        }
        return left_child.get_entry().word();
    }

    public static void main(String[] args) {
        BinarySearchTree bst = new BinarySearchTree();
        String res;
        DictEntry entry1 = new DictEntry("homework", "Very enjoyable work that students need to complete outside the classroom.", 1);
        DictEntry entry2 = new DictEntry("course", "A series of talks or lessons. For example, CS210.", 1);
        DictEntry entry3 = new DictEntry("class", "A set of students taught together,", 1);
        DictEntry entry4 = new DictEntry("computer", "An electronic machine frequently used by Computer Science students.", 1);
        DictEntry entry5 = new DictEntry("four", "One more than three", 1);
        try {
            int i = bst.insert(entry1);
            if (i == 1) {
                System.out.println("entry " + entry1.word() + " inserted");
            } else {
                System.out.println("entry " + entry1.word() + " not inserted");
            }
            System.out.println(bst.find("homework").get_entry().definition());
            i = bst.insert(entry2);
            if (i == 1) {
                System.out.println("entry " + entry2.word() + " inserted");
            } else {
                System.out.println("entry " + entry2.word() + " not inserted");
            }
            System.out.println(bst.find("course").get_entry().definition());
            i = bst.insert(entry3);
            if (i == 1) {
                System.out.println("entry " + entry3.word() + " inserted");
            } else {
                System.out.println("entry " + entry3.word() + " not inserted");
            }
            i = bst.insert(entry4);
            if (i == 1) {
                System.out.println("entry " + entry4.word() + " inserted");
            } else {
                System.out.println("entry " + entry4.word() + " not inserted");
            }
            i = bst.insert(entry5);
            if (i == 1) {
                System.out.println("entry " + entry5.word() + " inserted");
            } else {
                System.out.println("entry " + entry5.word() + " not inserted");
            }
            System.out.println(bst.find("computer").get_entry().definition());


        } catch (Exception e) {
            System.out.println("Test 1 failed");
        }
    }
}
