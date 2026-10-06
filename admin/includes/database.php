<?php
    mysqli_report(MYSQLI_REPORT_OFF);

    class MyConnect {
        private $host;
        private $user;
        private $passwd;
        private $database;
        private $port;
        private $conn;

        public function __construct() {
            // Configure these values with environment variables in production.
            // Defaults are suitable for a local MySQL/MariaDB installation.
            $this->host = getenv('DB_HOST') ?: '127.0.0.1';
            $this->user = getenv('DB_USER') ?: 'root';
            $this->passwd = getenv('DB_PASSWORD') ?: '';
            $this->database = getenv('DB_NAME') ?: 'clothingshop';
            $this->port = (int) (getenv('DB_PORT') ?: 3306);
            $this->conn = mysqli_init();

            $ssl = filter_var(getenv('DB_SSL') ?: 'false', FILTER_VALIDATE_BOOLEAN);
            if ($ssl) {
                $caFile = getenv('DB_SSL_CA') ?: '/etc/ssl/certs/ca-certificates.crt';
                $this->conn->ssl_set(NULL, NULL, $caFile, NULL, NULL);
                $this->conn->real_connect(
                    $this->host,
                    $this->user,
                    $this->passwd,
                    $this->database,
                    $this->port,
                    NULL,
                    MYSQLI_CLIENT_SSL
                );
            } else {
                $this->conn->real_connect(
                    $this->host,
                    $this->user,
                    $this->passwd,
                    $this->database,
                    $this->port
                );
            }

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
