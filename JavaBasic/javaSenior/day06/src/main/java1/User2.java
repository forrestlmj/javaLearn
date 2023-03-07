import java.util.Comparator;

public class User2 implements Comparable<User2> {
    private String name;
    private int age;

    public User2() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User2 user2 = (User2) o;

        if (age != user2.age) return false;
        return name != null ? name.equals(user2.name) : user2.name == null;
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + age;
        return result;
    }

    @Override
    public String toString() {
        return "User2{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public User2(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public int compareTo(User2 o) {
        return -Integer.compare(this.age,o.age);
    }
}
