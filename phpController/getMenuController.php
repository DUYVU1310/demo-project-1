<?php 

    include_once('createConnection.php');

    function getMenuChaByViTri_ReturnHTML($viTri){
        $connection = createConnection();
        $query = "select * from menu where vitri = '".$viTri."' and parentId is null";
        $result = $connection -> query($query);
        $connection -> close();
        if($result -> num_rows > 0){
           
            while($row = $result -> fetch_assoc()){
                echo '<li>';
                echo '<a href="'.$row['slug'].'">'.$row['tenMenu'].'</a>';
                //Sinh ra menu con
                getMenuConByMenuCha_ReturnHTML($row['id']);
                echo '</li>';
                
            }
            
        }
    }

    function getMenuConByMenuCha_ReturnHTML($id){
        $connection = createConnection();
        $query = "select * from menu where parentId = ".$id."";
        $result = $connection -> query($query);
        $connection -> close();
        if($result -> num_rows > 0){
            echo '<ul class="dropdown">';
                while($row = $result -> fetch_assoc()){
                    echo '<li class=""><a href="'.$row['slug'].'">'.$row['tenMenu'].'</a></li>';
                }
                echo '</ul>';
        }
    }

