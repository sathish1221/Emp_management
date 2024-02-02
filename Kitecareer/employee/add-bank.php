<?php
 session_start();

 if (!isset($_SESSION['emp_id'])) {
     header("Location: emp-login.php");
     exit();
 }
?>
<?php

require_once ('vendor/inc/connection.php');
$sql = "SELECT * FROM `employee` WHERE 1";

//echo "$sql";
$result = mysqli_query($conn, $sql);
if(isset($_POST['update']))
{

  $id = $_POST['emp_id'];
  $bank_holder_name = $_POST['bank_holder_name'];
  $bank_name = $_POST['bank_name'];
  $acc_no = $_POST['acc_no'];
  $ifsc_code = $_POST['ifsc_code'];
  $files = $_FILES['passbook_img'];
  $filename = $files['name'];
  $filrerror = $files['error'];
  $filetemp = $files['tmp_name'];
  $fileext = explode('.', $filename);
  $filecheck = strtolower(end($fileext));
  $fileextstored = array('png' , 'jpg' , 'jpeg');
  
if(in_array($filecheck, $fileextstored)){

    $destinationfile = '../images/'.$filename;
    move_uploaded_file($filetemp, $destinationfile);
 


 $result = mysqli_query($conn, "UPDATE `employee` SET `bank_holder_name`='$bank_holder_name', `bank_name`='$bank_name', `acc_no`='$acc_no',`ifsc_code`='$ifsc_code', `passbook_img`='$destinationfile' WHERE emp_id='$id'");

 echo ("<SCRIPT LANGUAGE='JavaScript'>
    window.alert('Succesfully Updated')
    window.location.href='my-profile.php?emp_id=$id  ';
    </SCRIPT>");

}
}
?>
<?php


  $id = (isset($_GET['emp_id']) ? $_GET['emp_id'] : '');
  $sql = "SELECT * from `employee` WHERE emp_id='$id'";
  $result = mysqli_query($conn, $sql);
  if($result){
  while($res = mysqli_fetch_assoc($result)){
    $bank_holder_name = $res['bank_holder_name'];
    $bank_name = $res['bank_name'];
    $acc_no = $res['acc_no'];
    $ifsc_code = $res['ifsc_code'];
    $passbook_img = $res['passbook_img'];
}
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include('vendor/inc/head.php');  ?>
   <link rel ="stylesheet" href = "vendor/css/profile.css">
</head>
<body>
<?php include('vendor/inc/nav.php');  ?>


<div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">Add Bank Account</h2>
                    <form id = "registration" action="profile_update.php" method="POST">


                        <div class="input-group">
                          <p>Bank Holder Name</p>
                            <input class="input--style-1" type="text"  name="bank_holder_name" value="<?php echo $bank_holder_name;?>">
                        </div>
                       
                        
                        <div class="input-group">
                          <p>Bank Name</p>
                            <input class="input--style-1" type="text" name="bank_name" value="<?php echo $bank_name;?>">
                        </div>

                        <div class="input-group">
                          <p>Account Number</p>
                            <input class="input--style-1" type="number" name="acc_no" value="<?php echo $acc_no;?>">
                        </div>

                        <div class="input-group">
                          <p>IFSC Code</p>
                            <input class="input--style-1" type="text" name="ifsc_code" value="<?php echo $ifsc_code;?>">
                        </div>

                        <div class="input-group">
                          <p>Passbook Image</p>
                            <input class="input--style-1" type="file" name="passbook_img" value="<?php echo $passbook_img;?>">
                        </div>

                        <div class="p-t-20">
                            <button class="btn btn--radius btn--green" type="submit" name="update">Update</button>
                        </div>
                        
                    </form>
                   </div>
            </div>
        </div>
    </div>

</body>
</html>