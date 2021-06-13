<?php
    include 'connect.php';
    define('UPLPATH', 'img/');
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
        <section class="heading">
            <h2><a href="kategorija.php?id=tehnologija">Tehnologija</h2>
        </section>
        <section class="row">
            <?php
                $query = "SELECT * FROM vijesti WHERE arhiva=0 AND kategorija='tehnologija' LIMIT 3";
                $result = mysqli_query($dbc, $query);
                $i = 0;
                while($row = mysqli_fetch_array($result)) {
                    echo '<article>';
                        echo '<img src="'. UPLPATH . $row ['slika'] .'"';
                        echo '<div>';
                        echo '<h4 class="articleHeading">';
                        echo '<a href="vijest.php?id='.$row['id'].'">';
                        echo $row['naslov'];
                        echo '</a></h4>';
						echo '<p>' . $row['sazetak'] . '</p>';
                        echo '<br>';
                        echo '<p>' .$row['datum'] . '</p>';
                        echo '<hr>';
                        echo '</div>';
                    echo '</article>';
                }
            ?>
        </section><div class="clear"></div>
        <section class="heading">
            <h2><a href="kategorija.php?id=auti">Automobili</h2>
        </section>
        <section class="row">
        <?php
                $query = "SELECT * FROM vijesti WHERE arhiva=0 AND kategorija='auti' LIMIT 3";
                $result = mysqli_query($dbc, $query);
                $i = 0;
                while($row = mysqli_fetch_array($result)) {
                    echo '<article>';
                        echo '<img src="'. UPLPATH . $row ['slika'] .'"';
                        echo '<div>';
                        echo '<h4 class="articleHeading">';
                        echo '<a href="clanak.php?id='.$row['id'].'">';
                        echo $row['naslov'];
                        echo '</a></h4>';
						echo '<p>' . $row['sazetak'] . '</p>';
                        echo '<br>';
                        echo '<p>' .$row['datum'] . '</p>';
                        echo '<hr>';
                        echo '</div>';
                    echo '</article>';
                }
            ?>
        </section>
    </main><div class="clear"></div>
    <footer>
        <h2 class="footerHeading">GoodHunter</h2>
    </footer>
</body>
</html>