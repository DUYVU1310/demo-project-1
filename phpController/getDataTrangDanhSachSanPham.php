<?php

    include_once('createConnection.php');
    //Phan quan trong nhat: Lay ra duocId cua danh muc de dieu huong trang web
    $danhMuc_id = $_GET['id'];


    //Lấy ra danh sách sản phẩm thuộc về danh mục có id = $danhMuc_id
    $danhSachSanPham = [];

    //Reset các tham số: 
    $connection = null;
    $query = null;
    $result = null;

    //Tao ra 1 ket noi den database
    $connection = createConnection();
    //Viet cau query lấy ra danh mục mà mình cần
    //Điều kiện danh sách danh mục
    
    $query = "
        select s.*, d.slug as slugDanhMuc
        from danhMuc as d
        join sanPhamTrongDanhMuc as sd on d.id = sd.danhMuc_id
        join sanPham as s on sd.sanPham_Id = s.id
        where d.id = ".$danhMuc_id."
    ";
    //Chuyen result -> array (object) ma chung ta co the goi duoc
    $result = $connection -> query($query);

    //Dong ket noi
    $connection -> close();
    if($result){
        while($row = $result->fetch_assoc()){
            $danhSachSanPham[] = $row;
        }
    }


    //Lay ra thong tin cua danh muc hien tai
    $danhMucHienTai = null;

    //Reset các tham số: 
    $connection = null;
    $query = null;
    $result = null;

    //Tao ra 1 ket noi den database
    $connection = createConnection();
    //Viet cau query lấy ra danh mục mà mình cần
    //Điều kiện danh sách danh mục
    
    $query = "
        select * from danhMuc d
        where d.id = ".$danhMuc_id."
    ";
    //Chuyen result -> array (object) ma chung ta co the goi duoc
    $result = $connection -> query($query);

    //Dong ket noi
    $connection -> close();
    if($result){
        while($row = $result->fetch_assoc()){
            $danhMucHienTai = $row;
        }
    }

    




    function renderDanhSachSanPham($param_danhSachSanPham){
        foreach($param_danhSachSanPham as $item){
            $rating_html = '';
            for($i = 0; $i < $item['rating']; $i++){
                $rating_html = $rating_html . '<i class="fa fa-star"></i>';
            }
            echo '
            <div class="col-lg-4 col-md-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="'.$item['avatarSanPham'].'">
                        <div class="label new">New</div>
                        <ul class="product__hover">
                            <li><a href="img/shop/shop-1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="chi-tiet-san-pham.php?id='.$item['id'].'">'.$item['tenSanPham'].'</a></h6>
                        <div class="rating">
                            '.$rating_html.'
                        </div>
                        <div class="product__price">$ '.$item['giaTien'].'</div>
                    </div>
                </div>
            </div>
            
            ';
        }
    }
