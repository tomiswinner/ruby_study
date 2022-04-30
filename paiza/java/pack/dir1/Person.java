public class Person{
	private int age;
	private String name;
	
	public Person(int age, String name){
		this.age = age;
		this.name = name;
	}

	public void printName(){
		System.out.println(this.name);
	}

	public void printAge(){
		System.out.println(this.age);
	}
}
