<?php
    include_once('createConnection.php');
    $sanPham_id = $_GET['id'];

    //Lay ra thong tin cua san pham hien tai
    $sanPhamHienTai = null;

    //Reset các tham số: 
    $connection = null;
    $query = null;
    $result = null;

    //Tao ra 1 ket noi den database
    $connection = createConnection();
    //Viet cau query lấy ra danh mục mà mình cần
    //Điều kiện danh sách danh mục
    
    $query = "
        select * from sanPham s
        where s.id = ".$sanPham_id."
        limit 1
    ";
    //Chuyen result -> array (object) ma chung ta co the goi duoc
    $result = $connection -> query($query);

    //Dong ket noi
    $connection -> close();
    //Kiem tra san pham hien tai
    // if($result -> num_rows == 0){
    //     header("Location: 404.php");
    // }
    if($result){
        while($row = $result->fetch_assoc()){
            $sanPhamHienTai = $row;
        }
    }   
    // if($sanPhamHienTai == null){
    //     header("Location: 404.php");
    // }
    // var_dump($sanPhamHienTai);
  

    //Lay ra thong tin cua danh muc chua san pham
    $danhMucChuaSanPham = null;
    //Reset các tham số: 
    $connection = null;
    $query = null;
    $result = null;

    //Tao ra 1 ket noi den database
    $connection = createConnection();
    //Viet cau query lấy ra danh mục mà mình cần
    //Điều kiện danh sách danh mục
    
    $query = "
       select d.*
       from sanPhamTrongDanhMuc sd
       join danhMuc d on sd.danhMuc_id = d.id
       where sd.sanPham_id = ".$sanPham_id."
    ";
    //Chuyen result -> array (object) ma chung ta co the goi duoc
    $result = $connection -> query($query);

    //Dong ket noi
    $connection -> close();
    if($result){
        while($row = $result->fetch_assoc()){
            $danhMucChuaSanPham = $row;
        }
    }



    //Lay danh sach anh hien tai
    $danhSachAnhSanPham = [];
    $danhSachAnhSanPham = explode(',',$sanPhamHienTai['danhSachAnh']);





    function renderDanhSachAnhNho($param_danhSachAnh){
        for($i = 0; $i < count($param_danhSachAnh); $i++){
            $active = $i==0?'active':'';
            echo '
            <a class="pt '.$active.'" href="#product-'.$i.'">
                <img src="'.$param_danhSachAnh[$i].'" alt="">
            </a>
            ';
        }
    }
    function renderDanhSachAnhTo($param_danhSachAnh){
        for($i = 0; $i < count($param_danhSachAnh); $i++){
            echo '<img data-hash="product-'.$i.'" class="product__big__img" src="'.$param_danhSachAnh[$i].'" alt="">';
        }
    }