-- 18/11/2025
-- Lấy ra tất cả danh sách Account hiển thị thông tin AccountID, Email, Fullname
SELECT accountID, Email, FullName FROM account;
SELECT DISTINCT (FullName) FROM account; -- DISTINCT: xóa các tên trùng nhau

-- Lấy ra tất cả Account mà thuộc phòng ban số 1 (DepartmentID) ==> Điều kiện DeparmentID = 1
SELECT * FROM Account WHERE DepartmentID = 1;

-- Toán tử AND
SELECT * FROM account WHERE DepartmentID = 2 AND PositionID = 2; -- Và
-- Lấy ra tất cả Account mà có DepartmentID = 2, 3, 7 
SELECT * FROM account WHERE DepartmentID = 2 OR DepartmentID = 3 OR DepartmentID = 7; -- Hoặc
SELECT * FROM account WHERE DepartmentID IN (2, 3, 7); -- Trong tập 

SELECT * FROM account WHERE DepartmentID NOT IN (2, 3, 7); -- NOT: phủ định
SELECT * FROM account WHERE DepartmentID BETWEEN 1 AND 20;
SELECT * FROM account WHERE CreateDate IS NULL; -- NULL: Trống rỗng, không có dữ liệu
SELECT * FROM account WHERE CreateDate IS NOT NULL;

SELECT * FROM account WHERE CreateDate > '2020-01-01 00:00:00';
-- Lấy ra tất cả bản ghi trong bảng Account, mà có fullname bắt đầu bằng chứ N
SELECT * FROM Account WHERE FullName LIKE 'N%'; -- LIKE: Sử dụng để so sánh gần đúng %WildCard (là tất cả các chữ cái còn lại)
SELECT * FROM Account WHERE LEFT(FullName, 1) = 'N'; -- Chữ cái đầu tiên là 'N' từ bên trái qua
-- Lấy ra tất cả bản ghi trong bảng Account, mà có fullname có chữ cái thứ 2 là 'U'
SELECT * FROM Account WHERE FullName LIKE '_u%'; -- _ chỉ hiển thị 1 ký tự trước	
-- %: Thay thế cho nhiều ký tự 
-- _:Thay thế cho 1 ký tự

-- Hãy đếm số bản ghi trong bảng Account
SELECT COUNT(*) FROM Account; -- Hàm-Function Count()-- đếm đố bản ghi trong kết quả đầu ra
SELECT COUNT(1) FROM Account; -- Khác cơ chế đếm, thêm một cột cuối để đếm
SELECT COUNT(createdate) FROM Account;
SELECT LENGTH('Fullname') FROM account; -- đếm số ký tự của chuỗi
SELECT lower('Fullname') FROM account; -- chuyển CHỮ HOA thành chữ thường
SELECT NOW(); -- lấy ngày giờ hiện tại
-- tính tổng điểm của các bạn học viên
SELECT SUM(Point_Student) FROM student;
-- tìm điểm số lớn nhất và nhỏ nhất trong bảng điểm 	
SELECT MAX(Point_Student)  FROM student;
SELECT MIN(Point_Student)  FROM student;
SELECT AVG(Point_Student)  FROM student; -- điểm trung bình lớp 

-- Tìm điểm số lớn nhất của môn SQL
SELECT MAX(Point_Student) FROM student  WHERE Subject_Name = 'Sql';
-- Tìm điểm số lớn nhất của môn Java
SELECT MAX(Point_Student) FROM student  WHERE Subject_Name = 'Java';
-- Tìm điểm số lớn nhất của môn Spring
SELECT MAX(Point_Student) FROM student  WHERE Subject_Name = 'Spring';