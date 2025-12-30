# 테스트 데이터 생성
use lms;

insert into department values(1, '수학');
insert into department values(2, '국문학');
insert into department values(3, '정보통신공학');
insert into department values(4, '모바일공학');

insert into student values(1, '가길동', 177, 1);
insert into student values(2, '나길동', 178, 1);
insert into student values(3, '다길동', 179, 1);
insert into student values(4, '라길동', 180, 2);
insert into student values(5, '마길동', 170, 2);
insert into student values(6, '바길동', 172, 3);
insert into student values(7, '사길동', 166, 4);
insert into student values(8, '아길동', 192, 4);

insert into professor values(1, '가교수', 1);
insert into professor values(2, '나교수', 2);
insert into professor values(3, '다교수', 3);
insert into professor values(4, '빌게이츠', 4);
insert into professor values(5, '스티브잡스', 3);

insert into course values(1, '교양영어', 1, '2016/9/2', '2016/11/30');
insert into course values(2, '데이터베이스 입문', 3, '2016/8/20', '2016/10/30');
insert into course values(3, '회로이론', 2, '2016/10/20', '2016/12/30');
insert into course values(4, '공업수학', 4, '2016/11/2', '2017/1/28');
insert into course values(5, '객체지향프로그래밍', 3, '2016/11/1', '2017/1/30');

insert into student_course values(1,1);
insert into student_course values(2,1);
insert into student_course values(3,2);
insert into student_course values(4,3);
insert into student_course values(5,4);
insert into student_course values(6,5);
insert into student_course values(7,5);

select * from course;
select * from department;
select * from professor;
select * from student;
select * from student_course;

# 문제 1. 학생번호, 학생명, 키, 학과번호, 학과명 정보 출력.
select s.student_id, s.student_name, s.height, s.department_id, d.department_name
from student as s
join department as d
on s.department_id = d.department_id;

# 문제 2. '가교수' 교수의 교수아이디 출력.
select professor_id from professor where professor_name = '가교수';

# 문제 3. 학과 이름별 교수의 수 출력.
select d.department_name, count(p.professor_id) as 교수의수
from department as d
join professor as p
on d.department_id = p.department_id
group by d.department_name;

# 문제 4. '정보통신공학'과의 학생정보 출력.
select s.student_id, s.student_name, s.height, d.department_id, d.department_name
from student as s
join department as d
on s.department_id = d.department_id
where d.department_name = '정보통신공학';

# 문제 5. '정보통신공학'과의 교수명 출력
select p.professor_id, p.professor_name, d.department_id, d.department_name
from professor as p
join department as d
on p.department_id = d.department_id
where d.department_name = '정보통신공학';

# 문제 6. '학생 중 성이 '아'인 학생이 속한 학과명과 학생명 출력
select s.student_name, d.department_name
from student as s
join department as d
on s.department_id = d.department_id
where s.student_name like '아%';

# 문제 7. 키가 180~190 사이에 속하는 학생 수를 출력
select count(student_id)
from student
where height between 180 and 190;

# 문제 8. 학과이름별 키의 최고값, 평균값을 출력.
select d.department_name, max(height), avg(height)
from department as d
join student as s
on d.department_id = s.department_id
group by s.department_name;

# 문제 9. '다길동' 학생과 같은 학과에 속한 학생의 이름 출력.
select student_name
from student
where department_id = (select department_id from student where student_name = '다길동');

# 문제 10. 2016년 11월 시작하는 과목을 수강하는 학생의 이름과 수강과목 출력.
select s.student_name, c.course_name
from student as s
join student_course as sc
on s.student_id = sc.student_id
join course as c
on c.course_id = sc.course_id
where c.start_date like '2016-11%';

# 문제 11. '데이터베이스 입문' 과목을 수강신청한 학생의 이름 출력.
select s.student_name
from student as s
join student_course as sc
on s.student_id = sc.student_id
join course as c
on c.course_id = sc.course_id
where c.course_name = '데이터베이스 입문';

# 문제 12. '빌게이츠' 교수의 과목을 수강신청한 학생수 출력.
select count(student_id)
from professor as p
join course as c
on p.professor_id = c.professor_id
join student_course as sc
on c.course_id = sc.course_id
group by p.professor_name
having professor_name = '빌게이츠';
