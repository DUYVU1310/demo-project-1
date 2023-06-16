<?php

include('createConnection.php');
$viTri = $_GET["viTri"];
getMenuByViTri_ReturnJSON($viTri);
function getMenuByViTri_ReturnJSON($viTri)
{
    $connection = createConnection();
    $query = "select * from menu where vitri = '" . $viTri . "' and parentId is null";
    $result = $connection->query($query);
    $connection->close();
    $rows = [];
    if ($result->num_rows > 0) {
        while($row = $result -> fetch_assoc()){
            array_push($rows, $row);
        }
        
    }
    $kq = json_encode($rows);
    echo $kq;
}
