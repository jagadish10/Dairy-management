<?php
include '../incl/header.incl.php';
include '../incl/conn.incl.php';
?>
<style>
body {
  background-image: url('rep12.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
</style>
<h1>Reports</h1>
<div class="span4">
<a href="farmer_monthly.php"><img src="../img/month.png"><br/>
    Per Farmer Delivery</a></div>
<div class="span4">
<a href="all_farmers.php"><img src="../img/month.png"><br/>
Total Farmers Delivery</a>
</div>
<?php
include  '../incl/footer.incl.php';
?>
