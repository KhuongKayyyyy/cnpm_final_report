/*CREATE DATABASE HASAKI
USE HASAKI
drop database HASAKI*/
CREATE TABLE Roles (--PHÂN QUYỀN CHỨC VỤ CHO EMPLOYEES
    RoleID int PRIMARY KEY,
    RoleName nvarchar(50)
)
INSERT INTO Roles VALUES(1,'admin'),(2,'Cashier'),(3,'Warehouse'),(4,'Delivery');

CREATE TABLE Employees (--NHÂN VIÊN
    EmployeeID int IDENTITY(1,1) PRIMARY KEY,
    Name nvarchar(50),
    CardID nvarchar(50),
    Phone nvarchar(20),
    Address nvarchar(100),
    Password nvarchar(30),
    Gender nvarchar(10),
    Birthday date,
    HireDate date,
    Salary int,
    RoleID int FOREIGN KEY REFERENCES Roles(RoleID)
)
INSERT INTO Employees (Name, CardID, Phone, Address, Password, Gender, Birthday, HireDate, Salary, RoleID)
VALUES ('Khánh', '09080706543', '0909090909', 'q7,tpHCM', 'Khanh123', 'male', '2002-01-01', '2021-01-01', 30000000, 1)--admin


CREATE TABLE Customers (--KHÁCH HÀNG
    CustomerID int IDENTITY(1,1) PRIMARY KEY,
    Name nvarchar(50),
    Email nvarchar(50),
    Phone nvarchar(20),
    Address nvarchar(100),
    Password nvarchar(30),
    Gender nvarchar(10),
    Birthday date
)
INSERT INTO Customers (Name, Email, Phone, Address, Password, Gender, Birthday)
VALUES ('JamesDuong', 'taonetuibay@gmail.com', '0909090909', 'q7,tpHCM', '123Duong', 'male', '2003-01-01'),
('KhuongDat', 'datkhuong@gmail.com', '0808080808', 'q7,tpHCM', '123Khuong', 'male', '2003-01-01'),
('NguyenThao', 'thaonguyen@gmail.com', '0707070707', 'q7,tpHCM', '123Nguyen', 'female', '2003-01-01');

CREATE TABLE Suppliers (--NHÀ CUNG CẤP
    SupplierID int IDENTITY(1,1) PRIMARY KEY,
    SupplierName nvarchar(50),
    Address nvarchar(100),
    Phone nvarchar(20),
    Email nvarchar(50),
    Image nvarchar(50),
    Followers nvarchar(50)
)
INSERT INTO Suppliers (SupplierName, Address, Phone, Email, Image, Followers)
VALUES ('LA ROCHE-POSAY', 'q1,tpHCM', '0283123456', 'abc@gmail.com','s1.jpg','14679'),
('ANESSA', 'q8,tpHCM', '0283000456', 'def@gmail.com','s2.jpg','2381'),
('L"OREAL', 'q7,tpHCM', '0200023456', 'hehe@gmail.com','s3.jpg','4802'),
('Klairs', 'q3,tpHCM', '0283120006', 'ok@gmail.com','s4.jpg','4690'),
('BIODERMA', 'q1,tpHCM', '0274873996', 'ko@gmail.com','s5.jpg','3541'),
('VASELINE', 'q2,tpHCM', '0757946353', 'kook@gmail.com','s6.jpg','3402');


CREATE TABLE Categories (--DANH MỤC SẢN PHẨM(LOẠI SẢN PHẨM)
    CategoryID int PRIMARY KEY,
    CategoryName nvarchar(50)
)
INSERT INTO Categories VALUES (1,'Sunscreen'),(2,'Cleanser'),(3,'Toner'),(4,'Face Wash'),(5,'Face Cream'),(6,'Serum'),(7,'Others');

CREATE TABLE Products (--SẢN PHẨM
    ProductID int IDENTITY(1,1) PRIMARY KEY,
    ProductName nvarchar(500),
    Image nvarchar(200),
    CategoryID int FOREIGN KEY REFERENCES Categories(CategoryID),
    SupplierID int FOREIGN KEY REFERENCES Suppliers(SupplierID),
    UnitPrice int,
    Description nvarchar(1000)
)
INSERT INTO Products (ProductName, Image, CategoryID, SupplierID, UnitPrice, Description)
VALUES (N'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu SPF50+ 50ml','1.jpg', 1, 1, 375000,N'Sản phẩm kem chống nắng dành cho làn da dầu mụn, sở hữu công nghệ cải tiến XL-Protect cùng kết cấu kem gel dịu nhẹ & không nhờn rít, giúp ngăn ngừa tia UVA/UVB + tia hồng ngoại + tác hại từ ô nhiễm, bảo vệ toàn diện cho làn da luôn khỏe mạnh.'),
(N'Nước Tẩy Trang La Roche-Posay Dành Cho Da Nhạy Cảm 400ml','2.jpg',2, 1, 396000, N'Sản phẩm tẩy trang dành cho da mặt, vùng mắt và môi, ứng dụng công nghệ Glyco Micellar giúp làm sạch sâu lớp trang điểm và bụi bẩn, bã nhờn trên da vượt trội mà vẫn êm dịu, không gây căng rát hay kích ứng da'),
(N'Kem Chống Nắng La Roche-Posay Không Màu Kiểm Soát Dầu 15ml','3.jpg',1, 1, 205000, N'Sản phẩm kem chống nắng dành cho làn da dầu mụn, sở hữu công nghệ cải tiến XL-Protect cùng kết cấu kem gel dịu nhẹ & không nhờn rít, giúp ngăn ngừa tia UVA/UVB + tia hồng ngoại + tác hại từ ô nhiễm, bảo vệ toàn diện cho làn da luôn khỏe mạnh.'),
(N'Kem Chống Nắng La Roche-Posay Giúp Giảm Mụn & Bóng Nhờn 50ml','4.jpg',1, 1, 451000, N'Sản phẩm kem chống nắng phổ rộng mới từ thương hiệu dược mỹ phẩm La Roche-Posay, với công thức chuyên biệt dành cho làn da dầu, nhạy cảm và mụn, cung cấp khả năng bảo vệ da khỏi tia UV hàng ngày'),
(N'Nước Tẩy Trang La Roche-Posay Cho Da Dầu, Nhạy Cảm 400ml','5.jpg',2, 1, 342000, N'Sản phẩm nước tẩy trang đến từ thương hiệu dược mỹ phẩm La Roche-Posay, với công nghệ cải tiến Glyco Micellar mang lại hiệu quả làm sạch sâu vượt trội'),
(N'Nước Tẩy Trang La Roche-Posay Cho Da Dầu, Nhạy Cảm 200ml','6.jpg',2, 1, 316000, N'Sản phẩm nước tẩy trang đến từ thương hiệu dược mỹ phẩm La Roche-Posay, với công nghệ cải tiến Glyco Micellar mang lại hiệu quả làm sạch sâu vượt trội'),
(N'[Mini] Nước Tẩy Trang La Roche-Posay Dành Cho Da Nhạy Cảm 50ml','7.jpg',2, 1, 79000, N'dung dịch nước tẩy trang dành cho da nhạy cảm, giúp nhẹ nhàng làm sạch bụi bẩn và các lớp trang điểm trên da (kể cả vùng mắt và môi), giúp làm sạch da chỉ trong một bước duy nhất'),
(N'Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm 400ml','8.jpg',4, 1, 476000, N'Sản phẩm sữa rửa mặt chuyên biệt dành cho làn da dầu, mụn, nhạy cảm đến từ thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng của Pháp, với kết cấu dạng gel tạo bọt nhẹ nhàng giúp loại bỏ bụi bẩn, tạp chất và bã nhờn dư thừa trên da hiệu quả'),
(N'Gel Rửa Mặt & Tắm La Roche-Posay Làm Sạch & Giảm Mụn 400ml','9.jpg',4, 1, 492000, N'Sản phẩm rửa mặt và sữa tắm 2 trong 1 mới nhất vừa được ra mắt từ thương hiệu dược mỹ phẩm La Roche-Posay, thuộc dòng Effaclar chăm sóc da dầu mụn, với tác động kép - hiệu quả 2 trong 1 dùng được cho mặt và toàn thân'),
(N'Sữa Rửa Mặt La Roche-Posay Cho Da Quá Nhạy Cảm 200ml','10.jpg',4, 1, 422000, N'Sản phẩm đến từ thương hiệu La Roche-Posay đình đám của nước Pháp. Sản phẩm thích hợp cho mọi loại da kể cả da nhạy cảm, không gây kích ứng, không paraben và hương liệu'),
(N'Kem Dưỡng La Roche-Posay Làm Dịu, Hỗ Trợ Phục Hồi Da 40ml','11.jpg',5, 1, 312000, N'Sản phẩm kem dưỡng dành cho da nhạy cảm đến từ thương hiệu La Roche-Posay, giúp dưỡng ẩm và làm dịu tình trạng da kích ứng, tổn thương, hỗ trợ phục hồi làn da'),
(N'Kem Dưỡng La Roche-Posay Làm Dịu, Hỗ Trợ Phục Hồi Da 100ml','12.jpg',5, 1, 507000, N'Sản phẩm kem dưỡng dành cho da nhạy cảm đến từ thương hiệu La Roche-Posay, giúp dưỡng ẩm và làm dịu tình trạng da kích ứng, tổn thương, hỗ trợ phục hồi làn da'),
(N'Kem Dưỡng La Roche-Posay Chuyên Biệt Ngừa Lão Hóa 30ml','13.jpg',5, 1, 792000, N'Sản phẩm thuộc thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng từ Pháp, với công thức đột phá mới chứa thành phần Retinol Linoleate, giúp ngăn ngừa các dấu hiệu lão hóa da và hỗ trợ làm giảm nếp nhăn sâu, làm đều màu da, mang lại cho bạn làn da tươi trẻ mịn màng hơn.'),
(N'Serum La Roche-Posay Giúp Tái Tạo & Phục Hồi Da 30ml','14.jpg',6, 1, 888000, N'Serum chuyên biệt của thương hiệu La Roche-Posay, với hoạt chất Hyaluronic Acid Duo giúp dưỡng ẩm chuyên sâu, cho da căng mịn; Vitamin B5 làm dịu & bảo vệ da; Madecassoside cải thiện làn da hư tổn nhanh chóng Kết cấu serum cực nhẹ, thẩm thấu nhanh vào da và không hề gây nhờn rít'),
(N'Serum La Roche-Posay Giúp Cải Thiện Và Làm Sáng Da 30ml','15.jpg',1, 1, 1148000, N'Thương hiệu dược mỹ phẩm Pháp La Roche-Posay đã nghiên cứu và cho ra đời dòng sản phẩm mới là La Roche-Posay Pure Vitamin C10 Serum – Serum chứa thành phần 10% Vitamin C nguyên chất chuyên biệt dành cho làn da nhạy cảm, dễ kích ứng'),
(N'Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu 60ml','16.jpg',1, 2, 428000, N'Sản phẩm chống nắng phiên bản mới nhất năm 2022 đến từ thương hiệu chống nắng dưỡng da ANESSA hàng đầu Nhật Bản suốt 21 năm liên tiếp, giúp chống lại tác hại của tia UV & bụi mịn tối ưu dưới mọi điều kiện sinh hoạt, kể cả thời tiết khắc nghiệt nhất'),
(N'Gel Chống Nắng Anessa Dưỡng Ẩm Bảo Vệ Hoàn Hảo 90g (Mẫu Mới 2022)','17.jpg',1, 2, 379000, N'Kem chống nắng da mặt phiên bản mới nhất năm 2022 đến từ thương hiệu chống nắng dưỡng da ANESSA hàng đầu Nhật Bản suốt 21 năm liên tiếp'),
(N'Serum Chống Nắng Anessa Dưỡng Da Nâng Tông 30ml (Mẫu Mới 2022)','18.jpg',1, 2, 595000, N'Kem chống nắng da mặt dạng serum mới ra mắt năm 2022 từ thương hiệu chống nắng dưỡng da ANESSA hàng đầu Nhật Bản suốt 21 năm liên tiếp, với kết cấu mỏng nhẹ, khô ráo, kiềm dầu nhưng vẫn duy trì độ ẩm cần thiết cho da, giúp nâng tông rạng rỡ với sắc hồng ngọc trai.'),
(N'Nước Tẩy Trang L"Oreal Tươi Mát Cho Da Dầu, Hỗn Hợp 400ml','19.jpg',2, 3, 159000, N'Sản phẩm tẩy trang dạng nước đến từ thương hiệu L"Oreal Paris, được ứng dụng công nghệ Micellar dịu nhẹ giúp làm sạch da, lấy đi bụi bẩn, dầu thừa và cặn trang điểm chỉ trong một bước, mang lại làn da thông thoáng, mềm mượt mà không hề khô căng'),
(N'Nước Tẩy Trang L"Oréal Làm Sạch Sâu Cho Da Dầu 400ml','20.jpg',2, 3, 199000, N'Sản phẩm tẩy trang dạng nước đến từ thương hiệu L"Oreal Paris, được ứng dụng công nghệ Micellar dịu nhẹ giúp làm sạch da, lấy đi bụi bẩn, dầu thừa và cặn trang điểm chỉ trong một bước, mang lại làn da thông thoáng, mềm mượt mà không hề khô căng'),
(N'Nước Tẩy Trang Mắt Môi L"Oréal Dịu Nhẹ Cho Da 125ml','21.jpg',2, 3, 164000, N'Với công thức đặc biệt dành cho loại da này, sản phẩm giúp rửa sạch lớp trang điểm mắt, môi thật dịu nhẹ, hiệu quả ngay với cả son, mascara và kẻ mắt nước không trôi. Bạn sẽ có làn môi và vùng da quanh mắt khỏe mạnh, ẩm mịn ngay sau khi dùng.'),
(N'Kem Dưỡng Ngày L"Oréal Ngừa Lão Hóa SPF35 PA++ 50ml','22.jpg',5, 3, 328000, N'Kem dưỡng ban ngày chuyên biệt cho làn da lão hóa của thương hiệu mỹ phẩm L"Oréal Paris, với công nghệ Dermalift độc đáo giúp làm săn chắc da, kết hợp cùng hoạt chất Pro-Retinol A giúp làm giảm nếp nhăn, mờ thâm sạm & đốm nâu, đẩy lùi các dấu hiệu lão hóa hiệu quả'),
(N'Serum L"Oreal Hyaluronic Acid Cấp Ẩm Sáng Da 30ml','23.jpg',6, 3, 359000, N'Sản phẩm serum đến từ thương hiệu L"Oréal Paris nổi tiếng của Pháp, với sự kết hợp không chỉ 1 mà đến 2 loại Hyaluronic Acid ưu việt ở nồng độ 1.5% sẽ là giải pháp chăm sóc da hiệu quả dành cho làn da khô & lão hóa'),
(N'Serum L"Oréal Dưỡng Sáng Và Mờ Thâm Nám 15ml','24.jpg',6, 3, 168000, N'Sản phẩm tinh chất dưỡng da đến từ thương hiệu mỹ phẩm L"Oreal Paris của Pháp, với phức hợp làm sáng 4 trong 1 trong đó chứa 1% Glycolic Acid có khả năng loại bỏ loại bỏ tế bào chết nhẹ nhàng, tái tạo da giúp các dưỡng chất thẩm thấu sâu vào da'),
(N'Dầu Tẩy Trang Klairs Làm Sạch Sâu Cho Mọi Loại Da 150ml','25.jpg',2, 4, 276000, N'Sản phẩm tẩy trang mặt đến từ thương hiệu Klairs của Hàn Quốc, với chiết xuất từ 6 loại dầu thực vật có khả năng làm sạch sâu cho da, loại bỏ các lớp trang điểm “cứng đầu” nhất. Đồng thời kiểm soát sản xuất bã nhờn và cung cấp dinh dưỡng cho làn da, ngăn chặn tình trạng mất nước và lão hóa trên da'),
(N'Nước Hoa Hồng Klairs Không Mùi Cho Da Nhạy Cảm 180ml','26.jpg',3, 4, 258000, N'Sản phẩm toner được thương hiệu dear,Klairs thiết kế chuyên biệt dành cho làn da nhạy cảm. Với bảng thành phần chiết xuất từ thực vật và kết cấu lỏng nhẹ, thấm nhanh trên da, nước hoa hồng Klairs sẽ giúp cân bằng độ pH và cấp ẩm cho làn da hiệu quả'),
(N'Nước Hoa Hồng Klairs Dành Cho Da Nhạy Cảm 180ml','27.jpg',3, 4, 259000, N'Sản phẩm toner được thương hiệu dear,Klairs thiết kế chuyên biệt dành cho làn da nhạy cảm. Với bảng thành phần chiết xuất từ thực vật và kết cấu lỏng nhẹ, thấm nhanh trên da, nước hoa hồng Klairs sẽ giúp cân bằng độ pH và cấp ẩm cho làn da hiệu quả'),
(N'Toner Klairs Cân Bằng Làm Sạch Dịu Nhẹ 500ml','28.jpg',3, 4, 387000, N'Dòng nước hoa hồng đến từ thương hiệu mỹ phẩm Klairs của Hàn Quốc, với chiết xuất 45% thành phần từ dưa leo giúp loại bỏ tế bào chết hằng ngày nhẹ nhàng, cung cấp nước và độ ẩm cần thiết cho da đem đến làn da căng mướt, rạng ngời, tràn đầy sức sống'),
(N'Sữa Rửa Mặt Klairs Dạng Bọt Cho Da Nhạy Cảm 100ml','29.jpg',4, 4, 324000, N'Sản phẩm sữa rửa mặt dạng bọt đến từ thương hiệu mỹ phẩm Klairs của Hàn Quốc, được thiết kế dành riêng cho làn da nhạy cảm. Công thức với lớp bông tạo bọt siêu mịn và thành phần làm sạch từ các amino acid có độ pH thấp sẽ giúp loại bỏ lớp bụi bẩn, bã nhờn trên bề mặt da một cách dịu nhẹ'),
(N'Sữa Rửa Mặt Klairs Dưỡng Ẩm, Dịu Nhẹ, Sạch Sâu 140ml','30.jpg',4, 4, 367000, N'Sản phẩm sữa rửa mặt đến từ thương hiệu mỹ phẩm Klairs của Hàn Quốc, chứa phức hợp đen từ các thành phần thiên nhiên giúp làm sạch sâu đồng thời dưỡng ẩm và nuôi dưỡng làn da khoẻ mạnh. Sản phẩm có độ pH lý tưởng 5.5 - 6.5 giúp duy trì độ ẩm tự nhiên của da, không gây cảm giác khô căng sau khi rửa mặt'),
(N'Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm 60ml','31.jpg',5, 4, 319000, N'Kem dưỡng dành cho da nhạy cảm đến từ thương hiệu Dear, Klairs trực thuộc By Wishtrend. Với thành phần Guaiazulene được chiết xuất từ dầu hoa cúc tạo màu xanh dịu mát tự nhiên, giúp làm dịu da kích ứng vô cùng hiệu quả, kết hợp cùng chiết xuất rau má cấp ẩm, làm dịu da và hỗ trợ phục hồi da mụn rất tốt'),
(N'Kem Dưỡng Ẩm Klairs Cho Da Khô, Nhạy Cảm 80ml','32.jpg',5, 4, 333000, N'Sản phẩm kem dưỡng được thương hiệu dear,Klairs thiết kế dành riêng cho tình trạng da khô, mất nước & nhạy cảm. Kem dưỡng có kết cấu đặc giúp cấp ẩm sâu nhằm khôi phục cân bằng độ ẩm, giúp da trở nên rạng rỡ và căng bóng hơn'),
(N'Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm 30ml','33.jpg',5, 4, 294000, N'Kem dưỡng dành cho da nhạy cảm đến từ thương hiệu Dear, Klairs trực thuộc By Wishtrend. Với thành phần Guaiazulene được chiết xuất từ dầu hoa cúc tạo màu xanh dịu mát tự nhiên, giúp làm dịu da kích ứng vô cùng hiệu quả, kết hợp cùng chiết xuất rau má cấp ẩm, làm dịu da và hỗ trợ phục hồi da mụn rất tốt'),
(N'Serum Klairs Vitamin C Cho Da Nhạy Cảm 35ml','34.jpg',6, 4, 280000, N'Sản phẩm tinh chất đến từ thương hiệu Klairs của Hàn Quốc, tiếp thêm sinh lực trẻ hóa làn da với sức mạnh của 5% Vitamin C dạng Acid L-ascorbic nhẹ dịu; cùng chiết xuất Rau Má không gây kích ứng nhưng vẫn hiệu quả trong việc làm mờ các vết mụn và vết nám, cải thiện làn da xỉn và không đều màu'),
(N'Mặt Nạ Klairs Làm Sạch & Dịu Mát Da 25ml','35.jpg',7, 4, 42000, N'Sản phẩm mặt nạ đến từ thương hiệu Dear Klairs – trực thuộc By Wishtrend Hàn Quốc, thuộc dòng Midnight Blue chuyên biệt cho da nhạy cảm và dễ kích ứng, giúp làm dịu da giảm viêm sưng, mẩn đỏ hiệu quả, được rất nhiều tín đồ làm đẹp ưa chuộng'),
(N'Kem Chống Nắng Bioderma Giảm Bóng Nhờn 40ml (Không Màu)','36.jpg',1, 5, 437000, N'Dòng sản phẩm chống nắng da mặt đến từ thương hiệu mỹ phẩm Bioderma của Pháp, với chỉ số chống nắng cao giúp bảo vệ da khỏi tác hại của tia UVA/UVB. Kết cấu lỏng nhẹ, với công thức kiểm soát dầu mang lại cảm giác khô thoáng, thấm nhanh và không để lại vệt trắng'),
(N'Nước Tẩy Trang Bioderma Dành Cho Da Dầu & Hỗn Hợp 500ml','37.jpg',2, 5, 393000, N'Sản phẩm tẩy trang dành cho da dầu, da hỗn hợp đến từ thương hiệu dược mỹ phẩm Bioderma, được ứng dụng công nghệ Micellar đình đám giúp loại bỏ lớp trang điểm cùng bụi bẩn và dầu thừa trên da hiệu quả mà không gây khô căng hay nhờn rít, tạo cảm giác thông thoáng cho da sau một ngày dài mệt mỏi'),
(N'[Mini] Nước Tẩy Trang Bioderma Dành Cho Da Nhạy Cảm 20ml','38.jpg',2, 5, 50000, N'Sản phẩm tẩy trang dành cho da dầu, da hỗn hợp đến từ thương hiệu dược mỹ phẩm Bioderma'),
(N'Nước Hoa Hồng Bioderma Dành Cho Da Nhạy Cảm 250ml','39.jpg',3, 5, 318000, N'Sản phẩm đến từ thương hiệu Bioderma nổi tiếng tại Pháp, với các chức năng chính là chăm sóc tăng cường độ ẩm cho da khỏe mạnh, nuôi dưỡng làn da giúp da trở nên tươi sáng hơn ngay sau khi sử dụng. Bênh cạnh đó, sản phẩm còn loại bỏ tạp chất dư thừa trên da, khôi phục và mang đến làn da rạng rỡ, đầy sức sống'),
(N'Dung Dịch Cân Bằng Da Bioderma Cho Da Dầu, Hỗn Hợp 200ml','40.jpg',3, 5, 400000, N'Sản phẩm nước cân bằng da (toner) dạng lỏng dành cho da hỗn hợp/ da dầu đến từ thương hiệu dược mỹ phẩm Bioderma, giúp điều chỉnh độ pH của da và kiểm soát lượng dầu thừa, cân bằng độ ẩm, hỗ trợ se nhỏ lỗ chân lông và hạn chế hình thành mụn'),
(N'Gel Rửa Mặt Bioderma Dành Cho Da Dầu & Hỗn Hợp 500ml','41.jpg',4, 5, 509000, N'Sữa rửa mặt thanh lọc dịu nhẹ được thương hiệu dược mỹ phẩm Bioderma thiết kế chuyên biệt dành cho làn da dầu & hỗn hợp, giúp loại bỏ các tạp chất trên da, giải phóng bít tắc và làm thông thoáng lỗ chân lông, đồng thời kiểm soát dầu thừa, ngăn ngừa mụn hiệu quả mà vẫn duy trì pH tự nhiên trên da'),
(N'Gel Rửa Mặt Bioderma Tạo Bọt Cho Da Nhạy Cảm 200ml','42.jpg',4, 5, 359000, N'Dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm Bioderma của Pháp, làm sạch sâu, dịu nhẹ với công nghệ micellar loại bỏ các bụi bẩn, bã nhờn dễ dàng mà không tác động mạnh lực mạnh lên da, tạo nên hàng rào bảo vệ da vững chắc cho da, cân bằng độ pH và độ ẩm cho làn da'),
(N'Gel Dưỡng Ẩm Bioderma Làm Dịu Cho Da Rất Khô 500ml','43.jpg',5, 5, 561000, N'Sản phẩm kem dưỡng đến từ thương hiệu dược mỹ phẩm Bioderma, giúp làm dịu da tức thì, giảm ngay cảm giác ngứa rát khó chịu và dưỡng ẩm suốt 24h. Đây món quà Bioderma dành tặng riêng cho làn da khô đến rất khô, dị ứng'),
(N'Kem Dưỡng Bioderma Hỗ Trợ Phục Hồi Da Tổn Thương 40ml','44.jpg',5, 5, 345000, N'Sản phẩm kem dưỡng ẩm hỗ trợ phục hồi và làm dịu làn da tổn thương, da nhạy cảm - kích ứng đến từ thương hiệu dược mỹ phẩm Bioderma nổi tiếng của Pháp, được các bác sĩ da liễu Pháp tin dùng. Sản phẩm có khả năng làm giảm các triệu chứng ngứa và khó chịu gần như ngay lập tức, đồng thời dưỡng ẩm và khôi phục da'),
(N'Dầu Tắm Bioderma Làm Sạch & Làm Dịu Da Khô, Nhạy Cảm 1L','45.jpg',7, 5, 473000, N'Sản phẩm dầu tắm chăm sóc và làm sạch dành cho cả gia đình. Với kết cấu dạng dầu giàu độ ẩm, dầu tắm Bioderma sẽ giúp nhẹ nhàng làm sạch, đồng thời nuôi dưỡng và làm dịu tình trạng da khô đến rất khô, da nhạy cảm, kích ứng'),
(N'Kem Chống Nắng Vaseline Bảo Vệ Da Hằng Ngày SPF 50+ 50ml','46.jpg',1, 6, 160000, N'Sản phẩm chống nắng hằng ngày dành cho da mặt đến từ thương hiệu mỹ phẩm Vaseline thuộc tập đoàn Unilever của Mỹ, với chỉ số chống nắng SPF 50+/PA+++ giúp bảo vệ làn da mạnh mẽ trước tác hại của ánh nắng mặt trời kết hợp cùng thành phần Petroleum jelly cung cấp độ ẩm và làm dịu làn da cháy nắng'),
(N'Sữa Dưỡng Thể Vaseline Sáng Da Chống Nắng Và Ô Nhiễm 200ml','47.jpg',7, 6, 78000, N'Sản phẩm dưỡng thể làm sáng da nổi tiếng thuộc thương hiệu mỹ phẩm VASELINE (Mỹ), được đông đảo người tiêu dùng yêu thích và lựa chọn sử dụng. Công thức cải tiến mới mang lại hiệu quả trắng sáng vượt trội, đồng thời vẫn đảm bảo cung cấp độ ẩm cần thiết'),
(N'Sáp Dưỡng Môi Vaseline Mềm Mịn 7g','48.jpg',7, 6, 65000, N'Đôi môi khô của bạn sẽ mềm mịn hẳn nếu sử dụng son dưỡng Vaseline Lip Therapy thường xuyên. Cung cấp chất dinh dưỡng, mang lại cho bạn làn da mềm mại. Nó có chức năng vừa là son dưỡng môi, giảm nứt nẻ. Vaseline cho bạn một đôi môi và làn da mềm, mượt mà'),
(N'Sữa Dưỡng Thể Vaseline Cấp Ẩm 4D Hyaluronic Acid 250ml','49.jpg',7, 6, 198000, N'Dòng dưỡng thể đến từ thương hiệu dưỡng thể số 1 thế giới Vaseline thuộc tập đoàn Unilever của Mỹ, với các hoạt tính cao cấp giúp dưỡng da hiệu quả, tăng cường dưỡng ẩm và làm sáng mịn da. Sản phẩm đã được kiểm nghiệm bởi các chuyên gia da liễu, an toàn trên da'),
(N'Son Dưỡng Môi Vaseline Chiết Xuất Lô Hội 4.8g','50.jpg',7, 6, 64000, N'Đôi môi khô của bạn sẽ mềm mịn hẳn nếu sử dụng Vaseline thường xuyên. Với công dụng cung cấp chất dinh dưỡng, mang lại cho bạn làn da mềm mại - Son Dưỡng Môi Dạng Thỏi Vaseline Lip Therapy 4.8g có chức năng vừa là son dưỡng môi, giảm nứt nẻ vừa có thể sử dụng như son lót trang điểm, giúp bảo vệ môi và giúp son lên màu chuẩn hơn'),
(N'Xịt Khoáng La Roche-Posay Làm Dịu Và Bảo Vệ Da 300g','51.jpg',7, 1, 369000, N'Dòng xịt khoáng chuyên biệt dành cho làn da nhạy cảm, dễ kích ứng, được sản xuất từ nước khoáng La Roche-Posay với nguồn khoáng chất cân bằng và giàu các nguyên tố vi lượng, đặc biệt là Selenium, sẽ giúp làm dịu mát làn da, giảm kích ứng và chống oxy hoá hiệu quả');
Select * from Products
CREATE TABLE Inventory (--KHO
    ProductID int PRIMARY KEY FOREIGN KEY REFERENCES Products(ProductID),
    QuantityInStock int
)
INSERT INTO Inventory (ProductID, QuantityInStock)
VALUES (1, 100),
(2, 100),
(3, 100),
(4, 100),
(5, 100),
(6, 100),
(7, 100),
(8, 100),
(9, 100),
(10, 100),
(11, 100),
(12, 100),
(13, 100),
(14, 100),
(15, 100),
(16, 100),
(17, 100),
(18, 100),
(19, 100),
(20, 100),
(21, 100),
(22, 100),
(23, 100),
(24, 100),
(25, 100),
(26, 100),
(27, 100),
(28, 100),
(29, 100),
(30, 100),
(31, 100),
(32, 100),
(33, 100),
(34, 100),
(35, 100),
(36, 100),
(37, 100),
(38, 100),
(39, 100),
(40, 100),
(41, 100),
(42, 100),
(43, 100),
(44, 100),
(45, 100),
(46, 100),
(47, 100),
(48, 100),
(49, 100),
(50, 100),
(51, 100);

CREATE TABLE Orders (--ĐƠN HÀNG
    OrderID int IDENTITY(1,1) PRIMARY KEY,
    OrderDate datetime,
    CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID),
    ShippingMethod nvarchar(50),
    ShippingFee int,
    OrderStatus nvarchar(50),
    TotalAmount int
)
INSERT INTO Orders (OrderDate, CustomerID, ShippingMethod, ShippingFee, OrderStatus,TotalAmount)
VALUES ('2023-05-06', 1, N'Normal shipping',15000,N'on the way',660000),
('2023-05-06', 1, N'Normal shipping',15000,N'on the way',408000),
('2023-04-12', 1, N'Fast shipping in 2 hours',25000,N'on the way',723000),
('2023-04-12', 2, N'Fast shipping in 2 hours',25000,'finished',502000),
('2023-04-30', 3, N'Normal shipping',15000,N'finish',533000),
('2023-05-15', 3, N'Normal shipping',15000,N'finish',142000),
('2023-05-15', 2, N'Fast shipping in 2 hours',25000,N'finish',609000),
('2023-05-20', 2, N'Normal shipping',15000,N'on the way',1980000);
Select*From Orders
CREATE TABLE OrderDetails (--CHI TIẾT ĐƠN HÀNG
    OrderDetailID int IDENTITY(1,1) PRIMARY KEY,
    OrderID int FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID int FOREIGN KEY REFERENCES Products(ProductID),
    Quantity int
)
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES (1, 1, 1),
(1, 10, 2),
(2, 5, 1),
(3, 1, 1),
(3, 3, 1),
(3, 20, 1),
(4, 2, 3),
(5, 7, 2),
(6, 16, 1),
(7, 9, 2),
(7, 12, 1),
(8, 14, 1),
(8, 18, 1);

CREATE TABLE feedback(-- comment ve san pham
	FeedbackID int IDENTITY(1,1) PRIMARY KEY,
	ProductID int FOREIGN KEY REFERENCES Products(ProductID),
	CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID),
	Rating INT,
	Comment NVARCHAR(200),
	FeedbackDate date,
	commentStatus NVARCHAR(10)
	--CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
	--CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)

CREATE TABLE Suppliers_Customers (--NHÀ CUNG CẤP
    FollowerID int IDENTITY(1,1) PRIMARY KEY,
    SupplierID int FOREIGN KEY REFERENCES Suppliers(SupplierID),
    CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID),
	--CONSTRAINT FK_SupplierID FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
	--CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)
INSERT INTO Suppliers_Customers (SupplierID, CustomerID)
VALUES (1, 1),
(2, 1),
(2, 3),
(3, 1),
(4, 1),
(4, 2),
(5, 1);

GO

CREATE FUNCTION GetOrderDetails(@OrderID int)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @OrderDetails nvarchar(max);
	SELECT @OrderDetails = STRING_AGG(CONCAT(ProductName, ' (', CAST(Quantity AS nvarchar(10)), ')'), '; ')
	FROM OrderDetails od
	INNER JOIN Products p ON od.ProductID = p.ProductID
	WHERE od.OrderID = @OrderID;
	RETURN @OrderDetails;
END;