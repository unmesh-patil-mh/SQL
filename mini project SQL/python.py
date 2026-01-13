import mysql.connector

# ------------------ MySQL Connection ------------------
conn = mysql.connector.connect(
    host="localhost",      # or your host
    user="root",           # your MySQL username
    password="password",   # your MySQL password
    database="student_management"
)
cursor = conn.cursor()

# ------------------ Functions ------------------

# Add Department
def add_department(name):
    cursor.execute("INSERT INTO department (dept_name) VALUES (%s)", (name,))
    conn.commit()
    print(f"Department '{name}' added successfully!")

# Add Section
def add_section(name):
    cursor.execute("INSERT INTO section (section_name) VALUES (%s)", (name,))
    conn.commit()
    print(f"Section '{name}' added successfully!")

# Add Course
def add_course(name, dept_id):
    cursor.execute("INSERT INTO course (course_name, dept_id) VALUES (%s, %s)", (name, dept_id))
    conn.commit()
    print(f"Course '{name}' added successfully!")

# Add Student
def add_student(first_name, last_name, dept_id, section_id):
    cursor.execute("INSERT INTO student (first_name, last_name, dept_id, section_id) VALUES (%s, %s, %s, %s)", 
                   (first_name, last_name, dept_id, section_id))
    conn.commit()
    print(f"Student '{first_name} {last_name}' added successfully!")

# Add Marks
def add_marks(student_id, course_id, marks):
    cursor.execute("INSERT INTO marks (student_id, course_id, marks_obtained) VALUES (%s, %s, %s)", 
                   (student_id, course_id, marks))
    conn.commit()
    print(f"Marks added successfully!")

# View Students
def view_students():
    cursor.execute("""
        SELECT s.student_id, s.first_name, s.last_name, d.dept_name, sec.section_name
        FROM student s
        LEFT JOIN department d ON s.dept_id = d.dept_id
        LEFT JOIN section sec ON s.section_id = sec.section_id
    """)
    rows = cursor.fetchall()
    print("ID | Name | Department | Section")
    for row in rows:
        print(row)

# View Marks
def view_marks():
    cursor.execute("""
        SELECT m.mark_id, s.first_name, s.last_name, c.course_name, m.marks_obtained
        FROM marks m
        LEFT JOIN student s ON m.student_id = s.student_id
        LEFT JOIN course c ON m.course_id = c.course_id
    """)
    rows = cursor.fetchall()
    print("MarkID | Student | Course | Marks")
    for row in rows:
        print(row)

# Update Student
def update_student(student_id, first_name=None, last_name=None, dept_id=None, section_id=None):
    query = "UPDATE student SET "
    params = []
    if first_name:
        query += "first_name=%s, "
        params.append(first_name)
    if last_name:
        query += "last_name=%s, "
        params.append(last_name)
    if dept_id:
        query += "dept_id=%s, "
        params.append(dept_id)
    if section_id:
        query += "section_id=%s, "
        params.append(section_id)
    query = query.rstrip(", ") + " WHERE student_id=%s"
    params.append(student_id)
    cursor.execute(query, tuple(params))
    conn.commit()
    print(f"Student ID {student_id} updated successfully!")

# Delete Student
def delete_student(student_id):
    cursor.execute("DELETE FROM student WHERE student_id=%s", (student_id,))
    conn.commit()
    print(f"Student ID {student_id} deleted successfully!")

# ------------------ Menu ------------------
def menu():
    while True:
        print("""
        1. Add Department
        2. Add Section
        3. Add Course
        4. Add Student
        5. Add Marks
        6. View Students
        7. View Marks
        8. Update Student
        9. Delete Student
        0. Exit
        """)
        choice = input("Enter choice: ")
        
        if choice == '1':
            name = input("Department Name: ")
            add_department(name)
        elif choice == '2':
            name = input("Section Name: ")
            add_section(name)
        elif choice == '3':
            name = input("Course Name: ")
            dept_id = int(input("Department ID: "))
            add_course(name, dept_id)
        elif choice == '4':
            first_name = input("First Name: ")
            last_name = input("Last Name: ")
            dept_id = int(input("Department ID: "))
            section_id = int(input("Section ID: "))
            add_student(first_name, last_name, dept_id, section_id)
        elif choice == '5':
            student_id = int(input("Student ID: "))
            course_id = int(input("Course ID: "))
            marks = float(input("Marks Obtained: "))
            add_marks(student_id, course_id, marks)
        elif choice == '6':
            view_students()
        elif choice == '7':
            view_marks()
        elif choice == '8':
            student_id = int(input("Student ID to update: "))
            first_name = input("New First Name (press Enter to skip): ")
            last_name = input("New Last Name (press Enter to skip): ")
            dept_id = input("New Department ID (press Enter to skip): ")
            section_id = input("New Section ID (press Enter to skip): ")
            update_student(student_id,
                           first_name if first_name else None,
                           last_name if last_name else None,
                           int(dept_id) if dept_id else None,
                           int(section_id) if section_id else None)
        elif choice == '9':
            student_id = int(input("Student ID to delete: "))
            delete_student(student_id)
        elif choice == '0':
            break
        else:
            print("Invalid Choice!")

if __name__ == "__main__":
    menu()
    cursor.close()
    conn.close()
