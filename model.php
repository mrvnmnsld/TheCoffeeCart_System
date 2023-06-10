<?php
    $database	= 'pos_db';
    $username	= 'root';
    $host		= 'localhost';
    $password	= '';

    $db = mysqli_connect($host,$username,$password,$database);

    if($_POST["action"]=="getAllAddOns"){
        $sql = "SELECT * FROM raw_mats WHERE (remarks = 'addons' AND kg > 0)";
        $result = mysqli_query($db, $sql);

        $rows = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $rows[] = $row;
            }
        }

        echo json_encode($rows);
    }

    if($_POST["action"]=="forgetPassword"){
        $sql = "SELECT * FROM users WHERE username = '".$_POST["username"]."' AND contact_number = '".$_POST["contact_no"]."'";
        $result = mysqli_query($db, $sql);

        $rows = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $rows[] = $row;
            }
        }

        if(count($rows)<=0){
            echo json_encode(array(
                "success"=>false,
                "msg"=>"No such user found",
            ));
        }else{
            $sql = "
                UPDATE users
                SET password = '".md5("coffeecart")."'
                WHERE username = '".$_POST["username"]."';
            ";

            $result = mysqli_query($db, $sql);

            echo json_encode(array(
                "success"=>true,
                "msg"=>"Password Reset Successfully",
            ));
        }
        
    }

    
?>