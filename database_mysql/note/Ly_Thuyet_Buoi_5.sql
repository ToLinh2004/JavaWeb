-- 22/11
-- Tại sao lại dùng join: Khi ta muốn lấy dữ liệu từ nhiều bảng có liên quan với nhau dựa trên một cột chung nào đó
-- Inner Join: Lấy các bản ghi có giá trị khớp nhau ở cả 2 bảng
SELECT A.AccountID, A.FullName, D.DepartmentName FROM Account A
INNER JOIN Department D ON A.DepartmentID = D.DepartmentID;
-- Left Join: Lấy tất cả các bản ghi từ bảng bên trái (bảng A), và các bản ghi khớp từ bảng bên phải (bảng D). Nếu không có bản ghi khớp, kết quả sẽ là NULL cho bảng bên phải. 
select * from account a left join department d on a.DepartmentID=d.DepartmentID; 
--<=> 
select * FROM department d right join account a on a.DepartmentID=d.DepartmentID;
-- Right Join: Lấy tất cả các bản ghi từ bảng bên phải (bảng D), và các bản ghi khớp từ bảng bên trái (bảng A). Nếu không có bản ghi khớp, kết quả sẽ là NULL cho bảng bên trái.
select * from account a right join department d on a.DepartmentID=d.DepartmentID; 
--<=>
select * FROM department d left join account a on a.DepartmentID=d.DepartmentID;

-- on delete cascade: Khi xóa bản ghi ở bảng cha thì các bản ghi liên quan ở bảng con cũng sẽ bị xóa theo
-- on delete set null: Khi xóa bản ghi ở bảng cha thì các bản ghi liên quan ở bảng con sẽ được đặt giá trị là NULL
-- on update cascade: Khi cập nhật bản ghi ở bảng cha thì các bản ghi liên quan ở bảng con cũng sẽ được cập nhật theo/ cập nhập cái gì thì cập nhật theo cái đó 
-- Ví dụ: Cập nhật DepartmentID ở bảng Department thì các bản ghi liên quan ở bảng Account cũng sẽ được cập nhật theo
-- on update set null: Khi cập nhật bản ghi ở bảng cha thì các bản ghi liên quan ở bảng con sẽ được đặt giá trị là NULL

