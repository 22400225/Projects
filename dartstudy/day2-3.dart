void introduce(String job, {required String name, int age = 20}){
    print("$job, $name, $age");
}

void main(){
    introduce( "student", age: 21, name: "jiwon");
}
