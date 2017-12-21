User.create!([
  {email: "admin@ttps.com.ar", encrypted_password: "$2a$11$EGSUrO0LiYvlrw4wBt.Yt.17GZtCXjEQ0Zc7j.3UhdCQxe9IwdzVG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-12-21 20:59:44", sign_in_count: 4, current_sign_in_at: "2017-12-21 21:52:38", last_sign_in_at: "2017-12-21 20:59:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "186.137.50.237"}
])
Course.create!([
  {year: 2016, title: "Turno Tarde"},
  {year: 2017, title: "Turno Manana"}
])
Exam.create!([
  {course_id: 2, title: "Examen 1", date: "2016-07-23", min: 6},
  {course_id: 2, title: "Examen 2", date: "2016-09-13", min: 9},
  {course_id: 2, title: "Examen 3", date: "2016-12-21", min: 10},
  {course_id: 1, title: "Examen 1", date: "2017-12-20", min: 9},
  {course_id: 1, title: "Examen 3", date: "2017-12-21", min: 12},
  {course_id: 1, title: "Examen 2", date: "2017-12-24", min: 5}
])
Result.create!([
  {mark: 4, exam_id: 4, student_id: 4},
  {mark: 10, exam_id: 4, student_id: 5},
  {mark: nil, exam_id: 4, student_id: 7},
  {mark: nil, exam_id: 5, student_id: 4},
  {mark: nil, exam_id: 5, student_id: 3},
  {mark: 4, exam_id: 4, student_id: 3},
  {mark: 5, exam_id: 5, student_id: 7},
  {mark: 3, exam_id: 6, student_id: 7},
  {mark: 11, exam_id: 6, student_id: 3},
  {mark: 11, exam_id: 5, student_id: 5},
  {mark: nil, exam_id: 6, student_id: 5},
  {mark: 9, exam_id: 4, student_id: 6},
  {mark: 9, exam_id: 5, student_id: 6},
  {mark: 9, exam_id: 6, student_id: 6},
  {mark: 10, exam_id: 6, student_id: 4},
  {mark: 15, exam_id: 1, student_id: 1},
  {mark: 15, exam_id: 7, student_id: 1},
  {mark: 15, exam_id: 2, student_id: 1},
  {mark: 10, exam_id: 1, student_id: 8},
  {mark: 3, exam_id: 1, student_id: 11},
  {mark: nil, exam_id: 1, student_id: 9},
  {mark: 3, exam_id: 1, student_id: 10},
  {mark: nil, exam_id: 7, student_id: 8},
  {mark: nil, exam_id: 7, student_id: 11},
  {mark: 8, exam_id: 7, student_id: 9},
  {mark: nil, exam_id: 7, student_id: 10},
  {mark: 5, exam_id: 2, student_id: 8},
  {mark: 12, exam_id: 2, student_id: 11},
  {mark: nil, exam_id: 2, student_id: 9},
  {mark: nil, exam_id: 2, student_id: 10}
])
Student.create!([
  {course_id: 2, surname: "Belenda", name: "Lucas", dni: "87654321", number: "65432/1", email: "estoes@un.email"},
  {course_id: 2, surname: "Borrelli", name: "Franco", dni: "12345678", number: "12345/6", email: "notengo@imaginacion.com"},
  {course_id: 1, surname: "Brost", name: "Pedro", dni: "12345678", number: "12345/6", email: "email3@email.com"},
  {course_id: 2, surname: "Liptak", name: "Franco", dni: "12345678", number: "12345/6", email: "email2@email.com"},
  {course_id: 1, surname: "Obama", name: "Barack", dni: "12345678", number: "12345/6", email: "obama@whitehouse.gov"},
  {course_id: 2, surname: "Onofri", name: "Camila", dni: "12345678", number: "12345/6", email: "email@email.com"},
  {course_id: 1, surname: "Pierobon", name: "Matias Marcos", dni: "12345678", number: "12345/6", email: "email4@email.com"},
  {course_id: 1, surname: "Raimondi", name: "Sebastian", dni: "40345182", number: "21755/8", email: "sebastianraimondi@gmail.com"},
  {course_id: 2, surname: "Rios", name: "Gaston", dni: "12345678", number: "12345/6", email: "email1@email.com"},
  {course_id: 1, surname: "Riquelme", name: "Juan Román", dni: "12345678", number: "12345/6", email: "riquelme@estafeliz.com"}
])
