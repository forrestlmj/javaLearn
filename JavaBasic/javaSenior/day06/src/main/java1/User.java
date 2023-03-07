public class User{
    private String name;
    private String classroom;

    public String getClassroom() {
        return classroom;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (birthyear != user.birthyear) return false;
        if (age != user.age) return false;
        if (name != null ? !name.equals(user.name) : user.name != null) return false;
        return classroom != null ? classroom.equals(user.classroom) : user.classroom == null;
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + (classroom != null ? classroom.hashCode() : 0);
        result = 31 * result + birthyear;
        result = 31 * result + age;
        return result;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public int getBirthyear() {
        return birthyear;
    }

    public void setBirthyear(int birthyear) {
        this.birthyear = birthyear;
    }

    private int birthyear;

    public User(String name, String classroom, int birthyear, int age) {
        this.name = name;
        this.classroom = classroom;
        this.birthyear = birthyear;
        this.age = age;
    }

    public User() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    public int getAge() {
        return age;
    }



    public void setAge(int age) {
        this.age = age;
    }

    private int age;
}
