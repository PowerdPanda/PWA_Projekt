<?php
    session_start();
    include 'connect.php';
    define('UPLPATH', 'img/');

    if (isset($_POST['prijava'])) {
        $prijavaImeKorisnika = $_POST['username'];
        $prijavaLozinkaKorisnika = $_POST['lozinka'];
        $sql = "SELECT korisnicko_ime, lozinka, razina FROM korisnik
        WHERE korisnicko_ime = ?";
        $stmt = mysqli_stmt_init($dbc);
        if (mysqli_stmt_prepare($stmt, $sql)) {
        mysqli_stmt_bind_param($stmt, 's', $prijavaImeKorisnika);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);
    }
 
    mysqli_stmt_bind_result($stmt, $imeKorisnika, $lozinkaKorisnika, $levelKorisnika);
    mysqli_stmt_fetch($stmt);

    if (password_verify($_POST['lozinka'], $lozinkaKorisnika) && mysqli_stmt_num_rows($stmt) > 0) {
        $uspjesnaPrijava = true;

        if($levelKorisnika == 1) {
            $admin = true;
        }
        else {
            $admin = false;
        }

        $_SESSION['$username'] = $imeKorisnika;
        $_SESSION['$level'] = $levelKorisnika;
    }   
    else {
        $uspjesnaPrijava = false;
        }
    }

    if(isset($_POST['delete'])){
        $id=$_POST['id'];
        $query = "DELETE FROM vijesti WHERE id=$id ";
        $result = mysqli_query($dbc, $query);
       }
    
       
    if(isset($_POST['update'])){
        $picture = $_FILES['pphoto']['name'];
        $title=$_POST['title'];
        $about=$_POST['about'];
        $content=$_POST['content'];
        $category=$_POST['category'];
        if(isset($_POST['archive'])){
        $archive=1;
        }else{
        $archive=0;
        }
        $target_dir = 'img/'.$picture;
        move_uploaded_file($_FILES["pphoto"]["tmp_name"], $target_dir);
        $id=$_POST['id'];
        $query = "UPDATE vijesti SET naslov='$title', sazetak='$about', tekst='$content', 
        slika='$picture', kategorija='$category', arhiva='$archive' WHERE id=$id ";
        $result = mysqli_query($dbc, $query);
    }
 
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
                $query = "SELECT * FROM vijesti";
                $result = mysqli_query($dbc, $query);
                while($row = mysqli_fetch_array($result)) {
                
                echo '<form enctype="multipart/form-data" action="" method="POST">
                <div class="form-item">
                <label for="title">Naslov vjesti:</label>
                <div class="form-field">
                <input type="text" name="title" class="form-field-textual" 
                value="'.$row['naslov'].'">
                </div>
                </div>
                <div class="form-item">
                <label for="about">Kratki sadržaj vijesti (do 50 
                znakova):</label>
                <div class="form-field">
                <textarea name="about" id="" cols="30" rows="10" class="formfield-textual">'.$row['sazetak'].'</textarea>
                </div>
                </div>
                <div class="form-item">
                <label for="content">Sadržaj vijesti:</label>
                <div class="form-field">
                <textarea name="content" id="" cols="30" rows="10" class="formfield-textual">'.$row['tekst'].'</textarea>
                </div>
                </div>
                <div class="form-item">
                <label for="pphoto">Slika:</label>
                <div class="form-field">
                <input type="file" class="input-text" id="pphoto" 
                value="'.$row['slika'].'" name="pphoto"/> <br><img src="' . UPLPATH . 
                $row['slika'] . '" width=100px>
                </div>
                </div>
                <div class="form-item">
                <label for="category">Kategorija vijesti:</label>
                <div class="form-field">
                <select name="category" id="" class="form-field-textual" 
                value="'.$row['kategorija'].'">
                <option value="sport">Sport</option>
                <option value="kultura">Kultura</option>
                </select>
                </div>
                </div>
                <div class="form-item">
                <label>Spremiti u arhivu: 
                <div class="form-field">';
                if($row['arhiva'] == 0) {
                echo '<input type="checkbox" name="archive" id="archive"/> 
                Arhiviraj?';
                } else {
                echo '<input type="checkbox" name="archive" id="archive" 
                checked/> Arhiviraj?';
                }
                echo '</div>
                </label>
                </div>
                </div>
                <div class="form-item">
                <input type="hidden" name="id" class="form-field-textual" 
                value="'.$row['id'].'">
                <button type="reset" value="Poništi">Poništi</button>
                <button type="submit" name="update" value="Prihvati"> 
                Izmjeni</button>
                <button type="submit" name="delete" value="Izbriši"> 
                Izbriši</button>
                </div>
                </form>';
                }

                if (($uspjesnaPrijava == true && $admin == true) || 
                    (isset($_SESSION['$username'])) && $_SESSION['$level'] == 1) {
                    $query = "SELECT * FROM vijesti";
                    $result = mysqli_query($dbc, $query);
                    while($row = mysqli_fetch_array($result)) {
                        echo '<form enctype="multipart/form-data" action="" method="POST">
            <div class="form-item">
                <span id="porukaIme" class="bojaPoruke"></span>
                <label for="title">Ime: </label>
                <div class="form-field">
                    <input type="text" name="ime" id="ime" class="form-fieldtextual">
                </div>
            </div>
            <div class="form-item">
                <span id="porukaPrezime" class="bojaPoruke"></span>
                <label for="about">Prezime: </label>
                <div class="form-field">
                    <input type="text" name="prezime" id="prezime" class="formfield-textual">
                </div>
            </div>
            <div class="form-item">
                <span id="porukaUsername" class="bojaPoruke"></span>
                <label for="content">Korisničko ime:</label>
                <div class="form-field">
                    <input type="text" name="username" id="username" class="formfield-textual">
                </div>
            </div>
            <div class="form-item">
                <span id="porukaPass" class="bojaPoruke"></span>
                <label for="pphoto">Lozinka: </label>
                <div class="form-field">
                    <input type="password" name="pass" id="pass" class="formfield-textual">
                </div>
            </div>
            <div class="form-item">
                <span id="porukaPassRep" class="bojaPoruke"></span>
                <label for="pphoto">Ponovite lozinku: </label>
                <div class="form-field">
                    <input type="password" name="passRep" id="passRep" class="form-field-textual">
                </div>
            </div>
            <div class="form-item">
                <button class="link" type="submit" value="prijava" id="stil"><a href="administracija.php">Prijava</a></button>
                <button type="submit" value="Prijava" name="prijava" id="slanje">Registriraj se</button>
            </div>   
        </form>';
    
            }
    } else if ($uspjesnaPrijava == true && $admin == false) {
    
    echo '<p>Bok ' . $imeKorisnika . '! Uspješno ste prijavljeni, ali niste administrator.</p>';
    } else if (isset($_SESSION['$username']) && $_SESSION['$level'] == 0) {
    echo '<p>Bok ' . $_SESSION['$username'] . '! Uspješno ste prijavljeni, ali niste administrator.</p>';
    } else if ($uspjesnaPrijava == false) {
        echo '<form enctype="multipart/form-data" action="" method="POST">
            <div class="form-item">
                <span id="porukaIme" class="bojaPoruke"></span>
                <label for="title">Ime: </label>
                <div class="form-field">
                    <input type="text" name="ime" id="ime" class="form-fieldtextual">
                </div>
            </div>
            <div class="form-item">
                <span id="porukaPrezime" class="bojaPoruke"></span>
                <label for="about">Prezime: </label>
                <div class="form-field">
                    <input type="text" name="prezime" id="prezime" class="formfield-textual">
                </div>
            </div>
            <div class="form-item">
                <span id="porukaUsername" class="bojaPoruke"></span>
                <label for="content">Korisničko ime:</label>
                <div class="form-field">
                    <input type="text" name="username" id="username" class="formfield-textual">
                </div>
            </div>
            <div class="form-item">
                <span id="porukaPass" class="bojaPoruke"></span>
                <label for="pphoto">Lozinka: </label>
                <div class="form-field">
                    <input type="password" name="pass" id="pass" class="formfield-textual">
                </div>
            </div>
            <div class="form-item">
                <span id="porukaPassRep" class="bojaPoruke"></span>
                <label for="pphoto">Ponovite lozinku: </label>
                <div class="form-field">
                    <input type="password" name="passRep" id="passRep" class="form-field-textual">
                </div>
            </div>
            <div class="form-item">
                <button class="link" type="submit" value="prijava" id="stil"><a href="administracija.php">Prijava</a></button>
                <button type="submit" value="Prijava" name="prijava" id="slanje">Registriraj se</button>
            </div>   
        </form>';
    }
            ?>
            <script type="text/javascript">
            document.getElementById("slanje").onclick = function(event) { 
                var slanjeForme = true;
                var poljeIme = document.getElementById("ime");
                var ime = document.getElementById("ime").value;
                if (ime.length == 0) {
                    slanjeForme = false;
                    poljeIme.style.border="1px dashed red";
                    document.getElementById("porukaIme").innerHTML="<br>Unesite ime!<br>";
                } else {
                    poljeIme.style.border="1px solid green";
                    document.getElementById("porukaIme").innerHTML="";
                }
                var poljePrezime = document.getElementById("prezime");
                var prezime = document.getElementById("prezime").value;
                if (prezime.length == 0) {
                    slanjeForme = false;
                    poljePrezime.style.border="1px dashed red";
                    document.getElementById("porukaPrezime").innerHTML="<br>Unesite Prezime!<br>";
                    
                } else {
                    poljePrezime.style.border="1px solid green";
                    document.getElementById("porukaPrezime").innerHTML="";
                }
               var poljeUsername = document.getElementById("username");
                var username = document.getElementById("username").value;
                if (username.length == 0) {
                    slanjeForme = false;
                    poljeUsername.style.border="1px dashed red";
                    document.getElementById("porukaUsername").innerHTML="<br>Unesite korisničko ime!<br>";
                   
                } else {
                    poljeUsername.style.border="1px solid green";
                    document.getElementById("porukaUsername").innerHTML="";
                }
                var poljePass = document.getElementById("pass");
                var pass = document.getElementById("pass").value;
                var poljePassRep = document.getElementById("passRep");
                var passRep = document.getElementById("passRep").value;
                if (pass.length == 0 || passRep.length == 0 || pass != passRep) {
                    slanjeForme = false;
                    poljePass.style.border="1px dashed red";
                    poljePassRep.style.border="1px dashed red";
                    document.getElementById("porukaPass").innerHTML="<br>Lozinke nisu iste!<br>";
                    document.getElementById("porukaPassRep").innerHTML="<br>Lozinke nisu iste!<br>";
                    return false;
                } else {
                    poljePass.style.border="1px solid green";
                    poljePassRep.style.border="1px solid green";
                    document.getElementById("porukaPass").innerHTML="";
                    document.getElementById("porukaPassRep").innerHTML="";
                }
            }
            if (slanjeForme != true) {
                event.preventDefault();
            }
        </script>
    </main><div class="clear"></div>
    <footer>
        <h2 class="footerHeading">GoodHunter</h2>
    </footer>
</body>
</html>