class Addition { 

    public int add( int a, int b){
        return a + b;
    }
    public double add( double a, double b){
        return a + b;
    }

    public int add(int a, int b, int c) {
        return a + b + c;
    }
    public String add( String a, String b){
        return a + b;
    }
    public boolean add( boolean a, boolean b){
        return a && b;
    }
    public char add( char a, char b){
        return (char)(a + b);
    }
}



public class main {
    public static void main(String[] args){
        Addition a = new Addition();
        System.out.println(a.add(1,2));
        System.out.println(a.add(1.0,2.0));
        System.out.println(a.add(1,2,3));
        System.out.println(a.add("Hello","World"));
        System.out.println(a.add(true,false));
        System.out.println(a.add('a','b'));
        System.out.println(a.add((byte)1,(byte)2));
    }    
}
