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
        <section class="uneseni-clanak">
            <p class="kategorija"><?php echo $category; ?></p>
            <h1 class="naslov"><?php echo $title; ?></h1>
            <p class="autor">AUTOR:</p>
            <p class="objavljeno">OBJAVLJENO:</p>
        <section class="slika">
            <?php echo "<img src='img/$picture'"; ?>
        </section>
        <section class="about">
            <p><?php echo $about; ?></p>
        </section>
        <section class="content">
            <p><?php echo $content; ?></p>
        </section>
        </section>
    </main>
	<footer>
        <h2 class="footerHeading">GoodHunter</h2>
    </footer>
</body>
</html>