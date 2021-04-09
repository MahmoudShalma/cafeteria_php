<?php include '../auth/admin_auth.php';
include 'header.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    <link rel="stylesheet" href="style.css">
</head>
<body>

<?php
 echo "<body style='background-color:#5c8a8a'>";
     $dsn = 'mysql:dbname=cafeteria;host:localhost';
    $user = 'root';
     $pass = '';
     $pdo;
    
   $pdo=new PDO($dsn,$user,$pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      if ($pdo) {
        //   echo "connect with database is success";
      } else {
          echo " connect with database is failed";
      }
  
   if(isset($_POST['delete'])){
       $product_Id=$_POST['product_Id'];
    $deleteQry="DELETE  FROM `products`  WHERE product_Id=:product_Id";     
    $count=$pdo->prepare($deleteQry);
    
     $count->bindParam(":product_Id",$product_Id,PDO::PARAM_INT);
    
     
    
    $count->execute(array('product_Id'=>$product_Id));
     echo $count->rowCount();
    }
    if(isset($_POST['update'])){
        $product_Id = $_POST['product_Id'];
        $product_name = $_POST['product_name'];
        $product_price = $_POST['product_price'];
        $product_picture = $_POST['product_picture'];
  
         echo "<form action='edit.php' method='POST'>
          <input type='number' name='product_Id' value='$product_Id' >
         <input type='text' name='product_name' value='$product_name' >
         <input type='number' name='product_price' value='$product_price' >
         <input type='text' name='product_picture' value='$product_picture' >
         <input type='submit' name='edit' value='edit'></form>";
        }
         

?>
</body>
</html>