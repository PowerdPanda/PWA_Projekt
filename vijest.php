<?php
include 'connect.php';
define('UPLPATH', 'img/');
$id =$_GET['id'];
$query = "SELECT * FROM vijesti WHERE id='$id'";
$result = mysqli_query($dbc, $query);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>GoodHunter</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <section class="pageHeading">
            <h1>GoodHunter</h1>
        </section>
        <nav>
            <ul>
                <li><a href="index.php">Početna</a></li>
                <li><a href="kategorija.php?id=tehnologija">Tehnologija</a></li>
                <li><a href="kategorija.php?id=auti">Automobili</a></li>
                <li><a href="administracija.php">Administracija</a></li>
                <li><a href="unos.php">Unos</a></li>
            </ul>
        </nav>
		<div class="clear"></div>
	</header>
    <main>
    <?php 
            while($row = mysqli_fetch_array($result)) {
				$id = $row['id'];
                echo '
                <h2 class="naslovKategorija">'.$row['kategorija'].'</h2>
                <div class="clanak">
                <h1 class="naslovClanka">'. $row['naslov'] .'</h1>
                <p>'.$row['datum'].'</p>
                <section class="slika">
                    <img src="'.UPLPATH . $row['slika'].'">
                </section>
                <section class="sadrzaj"> 
                    <p>
                      '.$row['tekst'].'
                    </p>
                </section>
                </div>';
            }
        ?>
    </main>
    <footer>
        <h2 class="footerHeading">GoodHunter</h2>
    </footer>
</body>
</html>