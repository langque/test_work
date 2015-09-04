# Students and Teachers

We are the government, and we need to find out which students and teachers share classes together in all our school districts.

## Input Format

You are given the following files. Each row of each file is a JSON object. (Note: the entire file is *not* a JSON array)

### students.txt

```
{"id": Integer, "first_name": String, "last_name": String}
```

### teachers.txt

```
{"id": Integer, "first_name": String, "last_name": String}
```

### classes.txt

```
{"id": Integer, "name": String}
```

### studentRoster.txt

```
{"student_id": Integer, "class_id": Integer}
```

### teacherRoster.txt

```
{"teacher_id": Integer, "class_id": Integer}
```

## Output Format

Write a program that reads this JSON file and outputs a CSV file with the following columns:

- student\_id
- student\_first\_name
- student\_last\_name
- teacher\_id
- teacher\_first\_name
- teacher\_last\_name

The rows in the CSV file must include the details of every teacher and student who are in *at least one* class together.

There must be no duplicate rows if a student and teacher share multiple classes.

## Deliverables

- Source code for the program in the language of your choice
