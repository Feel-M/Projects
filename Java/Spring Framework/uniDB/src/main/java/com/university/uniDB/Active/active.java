package com.university.uniDB.Active;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;
@Entity
public class active  {

        @Column
        @NotBlank
        private String course_name;


        @Column
        @Id
        private int student_ID;

        public active(String course_name, int student_ID) {
            this.course_name = course_name;
            this.student_ID = student_ID;
        }

    public active() {

    }

    public String getCourseName() {
            return course_name;
        }



        public void setCourseName(String courseName) {
            this.course_name = courseName;
        }

        public int getStudentId() {
            return student_ID;
        }

        public void setStudentId(int studentId) {
            this.student_ID = studentId;
        }

        @Override
        public String toString() {
            return "Active{" +
                    "courseName='" + course_name + '\'' +
                    ", studentId=" + student_ID +
                    '}';
        }
}
