-- 20/11/2025
-- Group by theo Subject_Name để gom nhóm các môn học lại với nhau 
-- Sau đó sử dụng hàm MAX(Point_Student) để tìm điểm số lớn nhất trong mỗi nhóm
SELECT  Subject_Name, MAX(Point_Student) AS MaxScore FROM Student GROUP BY Subject_Name;
-- HAVING: lọc dữ liệu sau khi đã group by 
select Subject_Name, Count(*) as Count_Student from student  group by Subject_Name having count(*) > 8;
--Order by: Sắp xếp dữ liệu theo cột nào đó ASC sắp xếp tăng dần-mặc định, DESC sắp xếp giảm dần
SELECT * FROM student ORDER BY Point_Student DESC;
-- Tìm fullname dài nhất trong bảng Account
-- Cách 1: Subquery: truy vấn bên trong một truy vấn khác
SELECT * FROM Account where length(FullName) = (select Max(length(FullName) )from Account) ;  
-- Cách 2: Sử dụng CTE (Common Table Expression)
With cte_MaxFullName AS (
    SELECT MAX(LENGTH(FullName)) AS Length_Math FROM Account
)
SELECT * FROM Account
WHERE LENGTH(FullName) = (SELECT Length_Math FROM cte_MaxFullName);

-- union: Nối kết quả của 2 hoặc nhiều truy vấn select với nhau
-- union all: giữ lại tất cả các bản ghi, kể cả bản ghi trùng lặp






