public class Employee implements Comparable<Employee>{

    private String name;
    private Integer age;

    @Override
    public String toString() {
        return "Employee{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", myDate=" + myDate +
                '}';
    }

    public Employee(String name, Integer age, MyDate myDate) {
        this.name = name;
        this.age = age;
        this.myDate = myDate;
    }

    private MyDate myDate;

    @Override
    public int compareTo(Employee o) {
        if(!this.myDate.equals(o.myDate)){
            return Integer.compare(this.age,o.age);
        }else return this.myDate.compareTo(o.myDate);
    }
}
