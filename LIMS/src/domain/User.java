package domain;

import java.sql.Timestamp;

//用户的JavaBean（实体类）
public class User {

    private int id;
    private String number;
    private String name;
    private String gender;
    private String age;
    private String province;
    private String city;
    private String district;
    private String classes;
    private String phone_number;
    private String email;
    private String password;
    private Integer authoritiy;
    private Integer login_times;
    private Timestamp last_time_login;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAuthoritiy() {
        return authoritiy;
    }

    public void setAuthoritiy(Integer authoritiy) {
        this.authoritiy = authoritiy;
    }

    public Integer getLogin_times() {
        return login_times;
    }

    public void setLogin_times(Integer login_times) {
        this.login_times = login_times;
    }

    public Timestamp getLast_time_login() {
        return last_time_login;
    }

    public void setLast_time_login(Timestamp last_time_login) {
        this.last_time_login = last_time_login;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", number='" + number + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", age='" + age + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", classes='" + classes + '\'' +
                ", phone_number='" + phone_number + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", authoritiy=" + authoritiy +
                ", login_times=" + login_times +
                ", last_time_login=" + last_time_login +
                '}';
    }
}
