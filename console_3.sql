use quanlydiemsv;

#Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh
#viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã
#sinh viên tăng dần

select *
from dmsv
order by MaSV;

#Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,
#Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ

select MaSV, Phai, NgaySinh
from dmsv
order by Phai;

# Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông
# tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select *
from dmsv
order by NgaySinh, HocBong desc;

# Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã
# môn, Tên môn, Số tiết.

select *
from dmmh
where TenMH like 'T%';

# Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm
# các thông tin: Họ tên sinh viên, Ngày sinh, Phái.

select concat(HoSV, ' ', TenSV) 'Họ tên sinh viên', NgaySinh, Phai
from dmsv
where TenSV like '%I';

# Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm
# các thông tin: Mã khoa, Tên khoa.


#          Liệt kê những sinh viên mà họ có chứa chữ Thị.

select *
from dmsv
where HoSV like '%THI%';

#Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các
#thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
#được sắp xếp theo thứ tự Mã khoa giảm dần

select MaSV, concat(HoSV, TenSV) 'HỌ và Tên', MaKhoa, HocBong
from dmsv
where HocBong > 100000
order by MaKhoa desc;

#. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm
#các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.

select concat(HoSV, TenSV) 'HỌ và Tên', MaKhoa, NoiSinh, HocBong
from dmsv
where NoiSinh = 'Hà Nội'
  and HocBong > 150000;

#Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông
#tin: Mã sinh viên, Mã khoa, Phái.

select MaSV, MaKhoa, Phai
from dmsv
where MaKhoa in ('AV', 'Vl');

#.Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày
#05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học
#bổng.
select MaSV, NgaySinh, NoiSinh, HocBong
from dmsv
WHERE ngaysinh BETWEEN '1991-01-01' AND '1992-06-05';

#Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các
#thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa
select MaSV, NgaySinh, Phai, MaKhoa
from dmsv
where HocBong between 80000 and 150000;

#.Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông tin: Mã môn học, Tên môn học, Số tiết.
select MaMH, TenMH, SoTiet
from dmmh
where SoTiet between 30 and 45;

#Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
select MaSV, concat(HoSV, TenSV) 'HỌ và Tên', TenKhoa, Phai
from dmsv
         join dmkhoa on dmsv.MaKhoa = dmkhoa.MaKhoa
where Phai = 'Nam'
  and dmsv.MaKhoa in ('AV', 'Th');

#Liệt kê những sinh viên nữ, tên có chứa chữ N
select *
from dmsv
where TenSV like '%N%'
  and Phai = 'Nữ';

#Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các
#thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.

#Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các
#thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
select MaSV, concat(HoSV, ' ', TenSV) 'HỌ và Tên', NoiSinh, NgaySinh
from dmsv
where NoiSinh = 'Hà Nội'
  and month(NgaySinh) = 2;

#Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh
#viên, Tuổi,Học bổng.
select concat(HoSV, ' ', TenSV) 'HỌ và Tên', year(curdate()) - year(NgaySinh) `Tuổi`, HocBong
from dmsv
where year(curdate()) - year(NgaySinh) > 20;

#Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh
#viên, Tuổi, Tên khoa.
select concat(HoSV, ' ', TenSV) 'HỌ và Tên', year(curdate()) - year(NgaySinh) `Tuổi`, TenKhoa
from dmsv
         join dmkhoa on dmsv.MaKhoa = dmkhoa.MaKhoa
where year(curdate()) - year(NgaySinh) between 20 and 25;

# Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ
# tên sinh viên,Phái, Ngày sinh.
select dmsv.HoSV, TenSV, Phai, NgaySinh
from dmsv
where month(NgaySinh) between 1 and 4
  and year(NgaySinh) = 1990;


# 24.Cho biết số lượng sinh viên học từng môn.
select dmmh.TenMH, count(distinct ketqua.MaSV) 'tổng số môn học'
from ketqua
         join dmmh on ketqua.MaMH = dmmh.MaMH
group by dmmh.MaMH
having count(distinct ketqua.MaSV) >= 2;

# Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên,
# Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học
# bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển
# thị là “Mức trung bình”
select MaSV,
       Phai,
       MaKhoa,
       CASE
           when HocBong > 500000 then 'Học bổng cao'
           else 'mức trung bình' END
from dmsv;

# 21.Cho biết tổng số sinh viên của toàn trường

select count(*) 'Tổng sinh vien toàn trường'
from dmsv;
# 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
# select count(*) 'Tổng sinh vien toàn trường', sum(CASE when Phai='Nữ' then 1 else 0 end ) 'Tổng so sinh vien nữ'
# from dmsv
# group by Phai;
select count(Phai) 'Tổng sinh vien toàn trường', count(Phai = 'Nữ') 'Tổng so sinh vien nữ'
from dmsv;
# 23.Cho biết tổng số sinh viên của từng khoa.

select MaKhoa, count(*) 'Số sinh viên trong từng khoa'
from dmsv
group by MaKhoa;

# Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có
# trong bảng kq)
select MaSV, count(MaMH) 'Số môn học'
from ketqua
group by MaSV;

# Cho biết tổng số học bổng của mỗi khoa.

select MaKhoa, count(HocBong) 'tổng số học bổng cu khoa'
from dmsv
group by MaKhoa;

# Cho biết học bổng cao nhất của mỗi khoa.
select MaKhoa, max(HocBong) 'Học bổng có giá trị cao nhất của khoa'
from dmsv
group by MaKhoa;

# Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa
select count(Phai = 'Nữ') 'Nữ', count(Phai = 'nam ') 'Nam'
from dmsv;

# Cho biết số lượng sinh viên theo từng độ tuổi.
select year(curdate()) - year(NgaySinh) 'Tuôi', count(*) ' tổng sv theo tuổi'
from dmsv
group by year(curdate()) - year(NgaySinh);

# .Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường 2 khoa chứ???
select count(*) 'số sinh viên đang theo học 2 khoa'
from dmsv
group by MaKhoa;

# Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường
select makhoa, count(*) 'số sinh viên có nhiều hơn 2 sv '
from dmsv
group by MaKhoa
having count(*) >= 2;

# .Cho biết những môn nào có trên 3 sinh viên dự thi.
select TenMH, count(MaSV) 'Sô môn có trên 3sv thi'
from dmmh
         join ketqua on dmmh.MaMH = ketqua.MaMH
group by TenMH
having count(MaSV) >= 3;

# Cho biết những sinh viên thi lại trên 2 lần.
select MaSV, count(LanThi) 'sinh vien có tre 2 lan thi'
from ketqua
group by MaSV
having count(LanThi) >= 2;

# .Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
select ketqua.MaSV, avg(Diem) 'Diểm tb'
from ketqua
         join dmsv on ketqua.MaSV = dmsv.MaSV
where Phai = 'Nam'
  and LanThi = 1
group by ketqua.MaSV;

# Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1
select ketqua.MaSV 'Danh sách sinh viên rớt lần 1 tre 2 môn'
from ketqua
         join dmsv on ketqua.MaSV = dmsv.MaSV
group by ketqua.MaSV
having count(LanThi = 2) >= 2;

# Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
select TenKhoa 'Khoa có sv nam >2'
from dmsv
         join dmkhoa on dmsv.MaKhoa = dmkhoa.MaKhoa
group by dmsv.MaKhoa
having count(Phai = 'nam') >= 2;

# Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000
select TenKhoa
from dmsv
         join dmkhoa on dmsv.MaKhoa = dmkhoa.MaKhoa
where HocBong between 200000 and 300000
group by dmsv.MaKhoa
having count(MaSV) >= 2;

# Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn
# trong lần thi 1.
select MaMH, count(dmsv.MaSV) 'Sinh viên đỗ l1'
from ketqua
         join dmsv on ketqua.MaSV = dmsv.MaSV
where LanThi = '1'
  and LanThi <> '2'
group by MaMH;

# .Cho biết sinh viên nào có học bổng cao nhất
SELECT *
FROM dmsv
order by HocBong
limit 1;

# Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
select dmsv.MaSV,
       HoSV,
       TenSV,
       Phai,
       NgaySinh,
       NoiSinh,
       MaKhoa,
       HocBong
from dmsv
         join ketqua on dmsv.MaSV = ketqua.MaSV
         join dmmh on ketqua.MaMH = dmmh.MaMH
where LanThi = '1'
  and TenMH = 'Cơ Sở Dữ Liệu'
  order by Diem desc
limit 1
;

# Cho biết sinh viên khoa anh văn có tuổi lớn nhất.

select MaSV,year(curdate())-year(NgaySinh) 'già đầu nhất'
from dmsv join dmkhoa on dmsv.MaKhoa = dmkhoa.MaKhoa
where TenKhoa = 'Anh văn'
order by year(curdate())-year(NgaySinh) desc
limit 1;

# Cho biết khoa nào có đông sinh viên nhất
select MaKhoa'Khoa có sv đông nhất'
from dmsv
group by MaKhoa
order by MaKhoa desc
limit 1;

# .Cho biết khoa nào có đông nữ nhất
select MaKhoa'Khoa có sv nữ đông nhất'
from dmsv
where Phai='nữ'
group by MaKhoa
order by MaKhoa desc
limit 1;

# Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
select TenMH'rớt nhiều l1'
from dmmh join ketqua on dmmh.MaMH = ketqua.MaMH
group by dmmh.MaMH
having count(LanThi=2)
limit 1;

#6.Cho biết sinh viên có nơi sinh cùng với Hải.
select *
from dmsv
where NoiSinh = (select NoiSinh
                 from dmsv
                 where TenSV ='Hải');

# .Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của
# sinh viên thuộc khoa anh văn
select *
from dmsv
where HocBong >(select sum(HocBong)
                from dmsv
                where MaKhoa='AV');

# Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên
# học khóa anh văn
select *
from dmsv
where HocBong >(select (HocBong)
                from dmsv
                where MaKhoa='AV');
# ho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm
# thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.
