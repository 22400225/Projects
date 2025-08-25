class Student {
    String name;
    String major;
    int age;

    public Student(String name, String major, int age) {
        this.name = name;
        this.major = major;
        this.age = age;
    }

    public void printInfo() {
        System.out.println("Name: " + name + ", Major: " + major + ", Age: " + age);
    }
}

public class Main1 {
    public static void main(String[] args) {
        Student s1 = new Student("Jiwon","Computer", 21);
        Student s2 = new Student("Jinwoo","Math", 22);

        s1.printInfo();
        s2.printInfo();
    }
}