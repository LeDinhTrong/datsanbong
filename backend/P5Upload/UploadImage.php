<?php
/**
* Author : https://www.roytuts.com
*/ 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['file'])) {

	if (isset($_FILES['file']['name'])) {

		if (0 < $_FILES['file']['error']) {

			echo 'Error during file upload ' . $_FILES['file']['error'];

		} else {

			$upload_path = 'uploads/images/';

			

			if (file_exists($upload_path . $_FILES['file']['name'])) {

				echo 'File already exists => ' . $upload_path . $_FILES['file']['name'];

			} else {

				if (!file_exists($upload_path)) {

					mkdir($upload_path, 0777, true);

				}

				$current_datetime = $_POST['current_datetime'] . '-';

				move_uploaded_file($_FILES['file']['tmp_name'], $upload_path . $current_datetime . $_FILES['file']['name']);

				echo '/uploads/images/' . $current_datetime . $_FILES['file']['name'];

			}

		}

	} else {

		echo 'Please choose a file';

	}

}
?>

