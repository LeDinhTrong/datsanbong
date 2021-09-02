<?php

// https://www.php.net/manual/en/mysqlnd-ms.quickstart.cache.php
class BaseQuery
{
    public $conn;
    public $debug;
    function __construct($conn)
    {
        $this->conn = $conn;

        // enable develop mode
        $this->debug = TRUE;
    }

    public function execSQL($sql)
    {
        // excute sql 
        $result = $this->conn->query($sql);

        // if insert success
        if ($this->conn->error != "") {
            // set response code
            http_response_code(401);

            return array(
                "status" => false,
                "insert_id" => $this->conn->insert_id,
                "data" => "[]",
                "error" => $this->conn->error,
                "sql" => $sql
            );
        } else {
            // set response code
            http_response_code(200);

            // echo json_encode($result);
            if (isset($result->num_rows) && ($result->num_rows > 0)) {
                // output data of each row 
                $data = array();
                while ($row = $result->fetch_assoc()) {
                    $data[] = $row;
                }

                // return data 
                if ($this->debug) {
                    return array(
                        "status" => true,
                        "insert_id" => $this->conn->insert_id,
                        "data" => $data,
                        "error" => $this->conn->error,
                        "sql" => $sql
                    );
                } else {
                    return array(
                        "status" => true,
                        "insert_id" => $this->conn->insert_id,
                        "data" => $data,
                        "error" => $this->conn->error
                    );
                }
            } else {
                // return data empty
                if ($this->debug) {
                    return array(
                        "status" => true,
                        "insert_id" => $this->conn->insert_id,
                        "data" => array(),
                        "error" => $this->conn->error,
                        "sql" => $sql
                    );
                } else {
                    return array(
                        "status" => true,
                        "insert_id" => $this->conn->insert_id,
                        "data" => array(),
                        "error" => $this->conn->error
                    );
                }
            }
        }
    }
}
