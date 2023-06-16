<?php 
    function createConnection(){
        $host = "localhost";
        $database = "webbanhang";
        $username = "root";
        $password = "your_password";

        $connection = new mysqli($host,$username,$password,$database);
        if($connection -> error){
            echo "Error connect!";
        }
        else{
            return $connection;
        }
    }
