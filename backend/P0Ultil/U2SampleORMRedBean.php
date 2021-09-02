<?php 
// https://redbeanphp.com/index.php?p=/quick_tour
// import red bean for mysql 
include_once 'libs/ORMRedBean/rb-mysql.php';

$servername = "localhost";  
$username = "root";
$password = "";
$dbname = "tool";  
R::setup( 'mysql:host='.$servername.';dbname='.$dbname, $username, $password );

// freeze data when deploy production
R::freeze( FALSE );

// use query cache
R::useWriterCache(true); 
 
// // insert data
// $test = R::dispense('test'); 
// $test->name = 'phuong';
// $test->address = 'da nang';
// $test->born = '1993-09-30';
// R::store($test);

// update data
// $test = R::load('test', 1);
// $test->name = 'phuong update 123';
// R::store($test);

// delete
// $test = R::load('test', 1);
// R::trash( $test ); //for one bean
// $tests = R::loadAll('test', array(1,2,3));
// R::trashAll( $tests ); //for multiple beans

// select 
// $test = R::load('test', 1); //for one bean
// $test = R::loadAll('test', array(1,2,3,4)); //for multiple beans  
// $test = R::findAll( 'test' );
// $test = R::findAll( 'test' , ' ORDER BY id DESC LIMIT 10 ' );
// print_r($test);
// echo json_encode($test);

// // select with condition
// $test  = R::find( 'test', ' rating > 4 ');
// $test  = R::find( 'test', ' rating > ? AND rating < ? ', [1,10]);
// $test = R::find( 'test', ' title LIKE ? ', [ 'Learn to%' ] );

// select limit
// $test = R::findAll( 'test' , ' ORDER BY id DESC LIMIT 10 ' );

// select raw sql
// $test = R::getAll('SELECT * FROM test WHERE id < ? and id > ?',[ 50,23 ] );
// echo json_encode($test);

// count page
// $count = R::count('test');
// print_r($count);

// join sql
// $test = R::getAll('SELECT test.*, post.* FROM test INNER JOIN post on test.id = post.id');
// echo json_encode($test);