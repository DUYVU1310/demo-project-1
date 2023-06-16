<?php 

include_once('createConnection.php');
//Tao ra cac du lieu de lam viec
$listDanhMucShop = [];
$danhMuc_to = null;
$danhMuc_nho = [];

//Tạo ra 1 kết nối đến database
$connection = createConnection();

//Viết query lấy ra tất cả các danh mục thuộc kiểu 'shop' và có parentid = 0
$query = "select * from danhmuc where loaiDanhMuc = 'shop' and parentId is null";

$result = $connection -> query($query);
//Fetch assoc cho các dòng dữ liệu vào mảng
while($row = $result -> fetch_assoc()){
    $listDanhMucShop[] = $row;
}
//Set cho danh muc to va danh muc nho
$danhMuc_to = $listDanhMucShop[0];
//Set cho danh muc nho
$danhMuc_nho = array_slice($listDanhMucShop,1);

//Reset các tham số: 
$connection = null;
$query = null;
$result = null;

//Khối sản phẩm mới

$dm_TrangChu = [];
$dm_hangMoiVe = null; //<-- Danh mục đầu tiên
$dm_hangMoiVe_con = [];
//Tao ra 1 ket noi den database
$connection = createConnection();
//Viet cau query lấy ra danh mục mà mình cần
$query = "select * from danhmuc where loaiDanhMuc = 'trang-chu' and parentId is null";
//Dong ket noi

$result = $connection -> query($query);
$connection -> close();
if($result){
    while($row = $result->fetch_assoc()){
        $dm_TrangChu[] = $row;
    }
}

$dm_hangMoiVe = $dm_TrangChu[0];

//Lay ra cac danh muc hang moi ve con

//Reset các tham số: 
$connection = null;
$query = null;
$result = null;
//Tao ra 1 ket noi den database
$connection = createConnection();
//Viet cau query lấy ra danh mục mà mình cần
$query = "select * from danhmuc where loaiDanhMuc = 'trang-chu' and parentId = ".$dm_hangMoiVe['id']."";

//Chuyen result -> array (object) ma chung ta co the goi duoc
$result = $connection -> query($query);

//Dong ket noi
$connection -> close();
if($result){
    while($row = $result->fetch_assoc()){
        $dm_hangMoiVe_con[] = $row;
    }
}


//Lấy ra danh sách sản phẩm thuộc về danh mục con của khối sản phẩm mới
$sanPhamDanhMucHangMoiVe = [];

//Reset các tham số: 
$connection = null;
$query = null;
$result = null;

//Tao ra 1 ket noi den database
$connection = createConnection();
//Viet cau query lấy ra danh mục mà mình cần
//Điều kiện danh sách danh mục
$dsId = [];
foreach($dm_hangMoiVe_con as $item){
    $dsId[] = $item['id'];
}
$query = "
    select s.*, d.slug as slugDanhMuc
    from danhMuc as d
    join sanPhamTrongDanhMuc as sd on d.id = sd.danhMuc_id
    join sanPham as s on sd.sanPham_Id = s.id
    where d.id in (".implode(",",$dsId).")
";
//Chuyen result -> array (object) ma chung ta co the goi duoc
$result = $connection -> query($query);

//Dong ket noi
$connection -> close();
if($result){
    while($row = $result->fetch_assoc()){
        $sanPhamDanhMucHangMoiVe[] = $row;
    }
}


//Tao ra cac ham sinh ma html
function renderDanhMucAnhTo($param_danhMuc){
    echo '
    <div class="col-lg-6 p-0">
        <div class="categories__item categories__large__item set-bg" data-setbg="'.$param_danhMuc['avatarDanhMuc'].'">
            <div class="categories__text">
                <h1>'.$param_danhMuc['tenDanhMuc'].'</h1>
                <p>Sitamet, consectetur adipiscing elit, sed do eiusmod tempor incidid-unt labore
                    edolore magna aliquapendisse ultrices gravida.</p>
                <a href="danh-sach-san-pham.php?id='.$param_danhMuc['id'].'">Shop now</a>
            </div>
        </div>
    </div>
    ';
}

function renderDanhSachDanhMucAnhNho($param_dsDanhMuc){
    foreach($param_dsDanhMuc as $item){
        echo '
        <div class="col-lg-6 col-md-6 col-sm-6 p-0">
            <div class="categories__item set-bg" data-setbg="'.$item['avatarDanhMuc'].'">
                <div class="categories__text">
                    <h4>'.$item['tenDanhMuc'].'</h4>
                    <p>'.$item['soLuongSanPham'].' items</p>
                    <a href="danh-sach-san-pham.php?id='.$item['id'].'">Shop now</a>
                </div>
            </div>
        </div>
        
        ';
    }
}

function renderDanhMucHangMoiVe($param_danhMucHangMoiVe){
    echo '<h4>'.$param_danhMucHangMoiVe['tenDanhMuc'].'</h4>';
}

function renderDanhMucHangMoiVeCOn($pram_dsDanhMucHangMoiVeCon){
    foreach($pram_dsDanhMucHangMoiVeCon as $item){
        echo '<li data-filter=".'.$item['slug'].'">'.$item['tenDanhMuc'].'</li>';
    }
    
}

function renderSanPhamHangMoiVe($param_dsSanPham){
    foreach($param_dsSanPham as $item){
        echo '
        <div class="col-lg-3 col-md-4 col-sm-6 mix '.$item['slugDanhMuc'].'">
            <div class="product__item">
                <div class="product__item__pic set-bg" data-setbg="'.$item['avatarSanPham'].'">
                    <div class="label new">'.$item['tag'].'</div>
                    <ul class="product__hover">
                        <li><a href="img/product/product-1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                        <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                    </ul>
                </div>
                <div class="product__item__text">
                    <h6><a href="chi-tiet-san-pham.php?id='.$item['id'].'">'.$item['tenSanPham'].'</a></h6>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <div class="product__price">$ '.$item['giaTien'].'</div>
                </div>
            </div>
        </div>
        ';
    }
}




























// //Get Khoi danh muc shop
// $connection = createConnection();
// $query = "select * from danhmuc where loaiDanhMuc = 'shop' and parentId is null";
// $result = $connection -> query($query);
// $connection -> close();

// if($result -> num_rows > 0){
//     while($object = $result -> fetch_assoc()){
//         $listDanhMuc[] = $object;
//     } 
// }

// //In khoi 1
// $danhMuc_to = $listDanhMuc[0];
// $danhMuc_nho = array_slice($listDanhMuc, 1);


// //Render danh muc 1
// function renderDanhMucShopTo($object){
//     echo  '
//     <div class="categories__item categories__large__item set-bg"
//     data-setbg="'.$object['avatarDanhMuc'].'">
//     <div class="categories__text">
//         <h1>'.$object['tenDanhMuc'].'</h1>
//         <p></p>
//         <a href="'.$object['slug'].'">Shop now</a>
//     </div>
//     ';
    
// }
// function renderDanhMucShopNho($listObject){
//     foreach($listObject as $item){
//         echo '
//         <div class="col-lg-6 col-md-6 col-sm-6 p-0">
//             <div class="categories__item set-bg" data-setbg="'.$item['avatarDanhMuc'].'">
//                 <div class="categories__text">
//                     <h4>'.$item['tenDanhMuc'].'</h4>
//                     <p>'.$item['soLuongSanPham'].'</p>
//                     <a href="'.$item['slug'].'">Shop now</a>
//                 </div>
//             </div>
//         </div>
//         ';
        
//     }
// }