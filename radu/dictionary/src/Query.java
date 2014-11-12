/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Adrian
 */

public class Query {
    
    public static void main(String[] args) {
        String fileName = args[0];
	String cmd = null;
	while(true) {
	    cmd = read();
	    System.out.println(cmd);
	    if (cmd.equalsIgnoreCase("end")) {
		System.exit(0);
	    } else if (cmd.equalsIgnoreCase("define")) {
	    } else if (cmd.equalsIgnoreCase("list")) {
	    } else if (cmd.equalsIgnoreCase("next")) {
	    }
	}
    }

    private static String read() {
        StringReader keyboard = new StringReader();
        return keyboard.read("Enter next command: ");
    }

}
