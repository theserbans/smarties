
public class OrderedDictionary implements OrderedDictionaryADT{
	
	BinarySearchTree dictionary = new BinarySearchTree();
	
	public String findWord (String word){
		TreeNodes found = dictionary.find(word);
		if (found == null){
			return "";
		} else {
			return found.get_entry().definition();
		}
	}
	
	public int findType (String word){
		TreeNodes found = dictionary.find(word);
		if (found == null){
			return -1;
		} else {
			return found.get_entry().type();
		}
	}
	
	public void insert (String word, String definition, int type) throws DictionaryException {
        int i  = dictionary.insert(new DictEntry (word, definition, type));
		if (i == -1){
			throw new DictionaryException("The entry is already in the dictionary");
		} else {
			//dictionary.insert(new DictEntry (word, definition, type));
            //do nothing, insert was successful
		}
	}
	
	public void remove (String word) throws DictionaryException{
        int i  = dictionary.remove(word);
		if (i == -1){
			throw new DictionaryException("The entry is not in the dictionary");
		} else {
			//dictionary.remove(word);
            //do nothing , remove was ok
		}
	}
	
	public String successor (String word){
		return dictionary.successor(word);
	}
	
	public String predecessor (String word){
		return dictionary.predecessor(word);
	}

}
