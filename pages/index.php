<!-- =============== | CABECERA | ============== --> 
<?php 
session_start();
if (isset($_SESSION["user"])) {
	include "layouts/header.php"; ?>
<!-- =========================================== --> 

<!-- ============== | CONTENIDO | ============== --> 
<div class="app-content content container-fluid">
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">

        </div>
    </div>
</div>
<!-- =========================================== --> 

<!-- ============ | SCRIPTS ROBUST | =========== --> 
<?php include "layouts/main_scripts.php"; ?>
<!-- =========================================== --> 

<!-- ================ | FOOTER | =============== --> 
<?php include "layouts/footer.php"; 
} else {
	header("Location:../");
}
?>
<!-- =========================================== --> 