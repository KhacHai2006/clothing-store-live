<?php
    class MyConnect {
        private $host;
        private $user;
        private $passwd;
        private $database;
        private $port;
        private $conn;

        public function __construct() {
            $this->host = "gateway01.ap-southeast-1.prod.aws.tidbcloud.com";
            $this->user = "2PTBkZLxrYwrgwr.root";
            $this->passwd = "wY4RzYVZcF0z9dxL";
            $this->database = "clothingshop";
            $this->port = 4000;
            $this->conn = mysqli_init();
            $this->conn->ssl_set(NULL, NULL, "/etc/ssl/certs/ca-certificates.crt", NULL, NULL);
            $this->conn->real_connect($this->host, $this->user, $this->passwd, $this->database, $this->port, NULL, MYSQLI_CLIENT_SSL);

        }
        public function setConnect()
        {

            if($this->conn->connect_errno) {
                echo "<script>alert('Kết Nối Thất Bại')</script>";
            }
        }

        public function getConn() {
            return $this->conn;
        }
        public function setNextRs() {
            mysqli_next_result($this->conn);
        }
        public function isConnected() {
            if($this->conn->connect_errno) 
                return false;
            return true;
        }

        public function getTableData($tableName) {
            if($this->isConnected()) {
                $query = "select * from ".$tableName;
                $tableData = mysqli_query($this->conn, $query);


                return $tableData;
            }
        }
        public function query($query) {
            if($this->isConnected()) {
                $tableData = mysqli_query($this->conn,$query);

                return $tableData;
            }
        }

        public function insertData($query)
        {
            if($this->isConnected()) {
                return mysqli_query($this->conn, $query);
            }
        }
        public function closeConnect() {
            mysqli_close($this->conn);
        }

    }
?>
