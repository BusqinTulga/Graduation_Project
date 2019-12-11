package domain;

public class people {
    private int id;
    private String name;
    private int age;
    private int sex_id;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getSex_id() {
        return sex_id;
    }

    public void setSex_id(int sex_id) {
        this.sex_id = sex_id;
    }

    @Override
    public String toString() {
        return "people{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", sex_id=" + sex_id +
                '}';
    }
}