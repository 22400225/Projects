void introduce(String job, {required String name, int age = 20}){
    print("$job, $name, $age");
}

void runfunction(Function f){
    f();
}

void main(){
    introduce( "student", age: 21, name: "jiwon");
    runfunction(() => introduce("student", age: 21, name: "jiwon"));
    
}
