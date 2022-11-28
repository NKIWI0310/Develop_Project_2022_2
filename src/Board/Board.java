package Board;

public class Board {
    private int entry_exit_id;

    private String name;

    private String student_id;
    private String phone_number;

    private String entry_time;

    private String exit_time;


    public int getEntry_exit_id() {
        return entry_exit_id;
    }

    public void setEntry_exit_id(int entry_exit_id) {
        this.entry_exit_id = entry_exit_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getEntry_time() {
        return entry_time;
    }

    public void setEntry_time(String entry_time) {
        this.entry_time = entry_time;
    }

    public String getExit_time() {
        return exit_time;
    }

    public void setExit_time(String exit_time) {
        this.exit_time = exit_time;
    }

}
