<?php 
    session_start();
    include("admin/includes/database.php");
    if(isset($_POST['login'])) {
        $MyConn = new MyConnect();

        $email = mysqli_real_escape_string($MyConn->getConn(), $_POST['email']);
        $pass = mysqli_real_escape_string($MyConn->getConn(), $_POST['passwd']);

        $query = "SELECT MA_KH FROM kh WHERE EMAIL='$email' AND MATKHAU='$pass'";

        $execute = $MyConn->query($query);

        $row = mysqli_fetch_array($execute);

        if ($row) {
            $userID = $row['MA_KH'];
            $_SESSION['user_id'] = $userID;
            $_SESSION['user_email'] = $email;

            echo "<script>window.history.back();</script>";
        } else {
            echo "<script>alert('Địa Chỉ Email Hoặc Mật Khẩu Không Đúng')</script>";
            echo "<script>window.history.back();</script>";
        }
    }
?>