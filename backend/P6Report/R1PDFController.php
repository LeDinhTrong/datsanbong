<?php
// include orm red bean
include_once('../P0Ultil/U2BaseORMRedBean.php');
include_once('../P0Ultil/libs/PhpToPDF/phpToPDF.php');

// get input 
$param = json_decode($_GET['input']);

if (isset($param->what)) {

    //******************Bussiness Logic pdf************************
    // sample url http://localhost:8012/api/izi-framework/P6Report/R1PDFController.php?input={"what":100,%20"action":"view","file_name":"phuong.pdf"}
    switch ($param->what) {
        // sample 100
        case 100: {
                // begin get data and process bussiness logic
                $test = R::load('test', 1);

                // load file html
                $body = file_get_contents('template/contents.html');

                // update content pdf html
                $body = str_replace('{{ name }}', $test->name, $body);
                $body = str_replace('{{ age }}', '27', $body);

                //Set Your Options -- we are saving the PDF as $param->filename to a 'downloads' folder
                $pdf_options = array(
                    "source_type" => 'html',
                    "source" => $body,
                    // action = view, save, download
                    "action" => $param->action,
                    "save_directory" => 'downloads',
                    "file_name" => $param->file_name
                );

                //Code to generate PDF file from options above
                phptopdf($pdf_options);
                break;
            }

            // sample 100
        case 101: {
                // begin get data and process bussiness logic
                $test = R::load('test', 1);

                // load file html
                $body = file_get_contents('template/general.html');

                // update content pdf html
                $body = str_replace('{{ name }}', $test->name, $body);
                $body = str_replace('{{ age }}', '27', $body);

                //Set Your Options -- we are saving the PDF as $param->filename to a 'downloads' folder
                $pdf_options = array(
                    "source_type" => 'html',
                    "source" => $body,
                    // action = view, save, download
                    "action" => $param->action,
                    "save_directory" => 'downloads',
                    "file_name" => $param->file_name
                );

                //Code to generate PDF file from options above
                phptopdf($pdf_options);
                break;
            }
    }
}
