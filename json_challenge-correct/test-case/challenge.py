# To run this script jsut type :
#	$python challeng2.py (enter)
# the result will output to result.csv, which will generate in local
# I tested the result by using "sort <file> | uniq -c"

# and please make sure the classes.txt, 
#						   studentRoster.txt, 
#						   teacherRoster.txt, 
#						   students.txt and teachers.txt
# in local folder.
# thx for read :)
import json 
import io
import json as simplejson
import csv

students_List = {}  # student object dict
teachers_List = {}	# teacher object dict
student_class = {}	# student connection with class
teacher_class = {}	# teacher connection with class
students = []	# list of students have same class
teachers = []	# list of teachers teaching same class

class student:
	def __init__(self, s_id, s_f_name, s_l_name, s_teacher):
		self.s_id = s_id
		self.s_f_name = s_f_name
		self.s_l_name = s_l_name
		self.s_teacher = []		#list of record the teacher's id, who has connection with this student
class teacher:
	def __init__(self, t_id, t_f_name, t_l_name):
		self.t_id = t_id
		self.t_f_name = t_f_name
		self.t_l_name = t_l_name
# read from student file init student object dict
f_student = open('students.txt', 'r')
for line in f_student:
	parsed_data = simplejson.loads(line)

	s_id = parsed_data['id']
	s_f_name = parsed_data['first_name']
	s_l_name = parsed_data['last_name']

	new_student = student(s_id,s_f_name,s_l_name,[]) # list of teacher's id init as empty in the beginning 
	students_List[s_id] = new_student

# read from teacher file init teacher object djct
f_teacher = open('teachers.txt', 'r')
for line in f_teacher:
	parsed_data = simplejson.loads(line)

	t_id = parsed_data['id']
	t_f_name = parsed_data['first_name']
	t_l_name = parsed_data['last_name']

	new_teacher = teacher(t_id,t_f_name,t_l_name)
	teachers_List[t_id] = new_teacher

#read student class information
f_studentRoster = open('studentRoster.txt', 'r')
for line in f_studentRoster:
	parsed_data = simplejson.loads(line)

	class_id = parsed_data['class_id']
	student_id = parsed_data['student_id']
	if student_class.has_key(class_id):				# beacuse there are more then one student may have this class,
		student_class[class_id].append(student_id)	# so this fild is a list of students, and the if condition is 
	else:											# checking do we need to init a new list for the current class id
		student_class[class_id]=[]
		student_class[class_id].append(student_id)

# read from teacher class file
f_teacherRoster = open('teacherRoster.txt', 'r')
for line in f_teacherRoster:
	parsed_data = simplejson.loads(line)

	class_id = parsed_data['class_id']
	teacher_id = parsed_data['teacher_id']
	if teacher_class.has_key(class_id):				# same as the above :)
		teacher_class[class_id].append(teacher_id)
	else:
		teacher_class[class_id] = []
		teacher_class[class_id].append(teacher_id)

# final process of this programming request 
result = []		# the main result table
f_class = open('classes.txt', 'r')					
for line in f_class:
	parsed_data = simplejson.loads(line)
	class_id = parsed_data['id']
	if student_class.has_key(class_id) and teacher_class.has_key(class_id):
		students = student_class[class_id]
		teachers = teacher_class[class_id]
		for s in students:							# here we get two list, one of student and one of teacher which they have same class in commen
			for t in teachers:						# since the question ask for the connection about student and teacher, then I pair all of them 
				s_id = students_List[s].s_id 		# together.
				s_f = students_List[s].s_f_name 
				s_l = students_List[s].s_l_name 
				s_t = students_List[s].s_teacher
				t_id = teachers_List[t].t_id 
				t_f =teachers_List[t].t_f_name
				t_l = teachers_List[t].t_l_name
				if t_id not in s_t:					# here the if condition is checking is this teacher already paired with this student, if no, this 
					students_List[s].s_teacher.append(t_id)	# pair will be record into the reuslt table.
					new_tuple = s_id,s_f,s_l,t_id,t_f,t_l
					result.append(new_tuple)

# file writing part
with open('result.csv', 'wb') as csvfile:
	writer = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL) # delimiter can change how to split the results
	for tup in result:
		writer.writerow(tup)















