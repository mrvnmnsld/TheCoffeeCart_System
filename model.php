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

    if($_POST["action"]=="getTotalDailySales"){
        // $sql = "SELECT * FROM raw_mats WHERE (remarks = 'addons' AND kg > 0)";
        $query = "
            SELECT FORMAT(SUM(sales.total),2) AS total_quantity
            FROM sales
            WHERE date LIKE '%".date('Y-m-d')."%'
            GROUP BY date
        ";

        $result = mysqli_query($db, $query);

        $rows = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $rows[] = $row;
            }
        }

        echo json_encode($rows);
    }

    if($_POST["action"]=="getTotalMonthlySales"){
        // $sql = "SELECT * FROM raw_mats WHERE (remarks = 'addons' AND kg > 0)";
        $query = "
            SELECT FORMAT(SUM(sales.total),2) AS total_quantity
            FROM sales
            WHERE date LIKE '%".date("Y-m")."%'
        ";

        $result = mysqli_query($db, $query);

        $rows = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $rows[] = $row;
            }
        }

        echo json_encode($rows);
    }

    if($_POST["action"]=="getTotalCountSales"){
        $query = "
            SELECT count(*) AS total_quantity
            FROM sales
        ";

        $result = mysqli_query($db, $query);

        $rows = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $rows[] = $row;
            }
        }

        echo json_encode($rows);
    }

    if($_POST["action"]=="getTotalCountProducts"){
        $query = "
            SELECT count(*) AS total_quantity
            FROM products
        ";

        $result = mysqli_query($db, $query);

        $rows = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $rows[] = $row;
            }
        }

        echo json_encode($rows);
    }

    if($_POST["action"]=="getChartData6Months"){

        // $query = "
        //     SELECT count(*) AS total_quantity
        //     FROM products
        // ";

        // $result = mysqli_query($db, $query);

        // $rows = array();
        // if (mysqli_num_rows($result) > 0) {
        //     while ($row = mysqli_fetch_assoc($result)) {
        //         $rows[] = $row;
        //     }
        // }

        // echo json_encode($rows);

        $months = array();
        $monthsLabels = array();
        $monthData = array();

        for ($i = 5; $i >= 0; $i--) {
            $month = date("Y-m", strtotime("-$i months"));
            $months[] = $month;

            $month = date("M", strtotime("-$i months"));
            $monthsLabels[] = $month;
        }

        foreach ($months as $value) {
            $query = "
                SELECT COALESCE(FORMAT(SUM(sales.total),2), 0) AS total_quantity
                FROM sales
                WHERE date LIKE '%".$value."%'
            ";

            $result = mysqli_query($db, $query);

            $rows = array();

            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $rows[] = $row;
                }
            }

            $monthData[] = $rows[0]["total_quantity"];
        }

        echo json_encode(array(
            "chartLabels"=>$monthsLabels,
            // "month"=>$months,
            "monthData"=>$monthData,
            
        ));

    }

    

    

    

    
?>