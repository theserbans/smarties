public class TreeNodes {

	 private TreeNodes parent;
	 private DictEntry node;
	 private TreeNodes lefty;
	 private TreeNodes righty;
	
	//Constructor for empty node (leaf nodes)
	
	public TreeNodes(){									
		this.node = new DictEntry("", null, -1);
	}
	
	// Set methods
	
	public void set_entry(DictEntry entry){
		this.node = entry;
	}

	public void set_left(TreeNodes entry){
		this.lefty = entry;
	}
	
	public void set_right(TreeNodes entry){
		this.righty = entry;
	}
	
	public void set_parent(TreeNodes entry){
		this.parent = entry;
	}
	
	// Get methods
	
	public TreeNodes get_left(){
		return lefty;
	}
	
	public TreeNodes get_right(){
		return righty;
	}
	
	public TreeNodes get_parent(){
		return parent;
	}
	
	public DictEntry get_entry(){
		return node;
	}
	
}
