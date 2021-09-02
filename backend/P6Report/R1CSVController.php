<?php

// include orm red bean
include_once('../P0Ultil/U2BaseORMRedBean.php');
include_once('../P0Ultil/U6BaseReportCSV.php');
header('Content-type: text/csv; charset=UTF-8');

// get input 
$param = json_decode($_GET['input']);

if (isset($param->what)) {

  //******************Bussiness Logic pdf************************
  // sample url http://localhost:8012/api/izi-framework/P6Report/R1CSVController.php?input={"what":100,"filename":"namefilecsv","id":"1"}
  switch ($param->what) {
    // sample 100
    case 100: {
        // filename for download
        $filename = $param->filename . date('Ymdhis') . ".csv"; 
        header("Content-Disposition: attachment; filename=\"$filename\"");
        
        $out = fopen("php://output", 'w+');

        // add BOM to fix UTF-8 in Excel
        fputs($out, $bom = (chr(0xEF) . chr(0xBB) . chr(0xBF)));

        //**************************** BEGIN UPDATE ************************
        // get data for csv
        $data = R::getAll("SELECT * FROM test WHERE id='$param->id'");

        // Update columns of file CSV
        $colnames = array(
          'id' => "STT",
          'name' => "Tên",
          'address' => "Địa chỉ",
          'born' => "Ngày sinh",
        );
        //**************************** END UPDATE ***************************

        $flag = false;
        foreach ($data as $row) {
          if (!$flag) {
            // display field/column names as first row
            $firstline = array_map(__NAMESPACE__ . '\map_colnames', array_keys($row));
            fputcsv($out, $firstline, ',', '"');
            $flag = true;
          }
          array_walk($row, __NAMESPACE__ . '\cleanData');
          fputcsv($out, array_values($row), ',', '"');
        }

        fclose($out);
        break;
      }

    // sample 100
    case 101: {
          
        break;
      }
  }
}
