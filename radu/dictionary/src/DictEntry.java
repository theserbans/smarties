public class DictEntry {

	private String word = "";
	private String definition = "";
	private int type = 0;
	
	public DictEntry (String word, String definition, int type){
		this.word = word;
		this.definition = definition;
		this.type = type;
	}
	
	public String word(){
		return word;
	}
	
	public String definition(){
		return definition;
	}
	
	public int type(){
		return type;
	}
	
}
