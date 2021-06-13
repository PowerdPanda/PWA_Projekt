-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 12, 2021 at 06:05 PM
-- Server version: 8.0.23
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekt`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int NOT NULL,
  `ime` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `korisnicko_ime` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lozinka` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `razina` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(4, 'Pero', 'Perić', 'pperic', 'peroperic', 0),
(5, 'Ivan', 'Minković', 'iminkovic', 'minkovicivan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int NOT NULL,
  `datum` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `naslov` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sazetak` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tekst` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slika` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `kategorija` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `arhiva` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `datum`, `naslov`, `sazetak`, `tekst`, `slika`, `kategorija`, `arhiva`) VALUES
(1, '8.6.2021.', 'Huawei Watch 3', 'Jaka baterija i dalje je jedan od najjačih aduta. U Pro verziji ona može izdržati i do tri tjedna s jednim punjenjem', 'Huawei Watch 3 nova je generacija Huaweijevih satova, koje pokerće Harmony OS 2 kojim žele ponuditi nove načine povezivanja s Huwei uređajima na Harmonyju, a prvi put uključuje i novi senzor visoke preciznosti za mjerenje temperature kože, navode iz kineske kompanije. Tu su još i senzori za pranje ruku i otkrivanje pada.\r\n\r\n- Novi pametni satovi neovisni su, pametni i moćni poput pametnih telefona. Dizajnirani su kako bi svakodnevni život učinili praktičnijim nego prije - rekao je Kevin Ho, glavni operativni direktor kompanije Huawei Consumer BG.\r\n\r\n- Praćenje zdravlja i tjelesne spreme oduvijek je bila jedna od prednosti naših nosivih uređaja, a ovaj put uključili smo i mjerenje temperature kože, otkrivanje potrebe pranja ruku i pada, kako bismo ponudili potpuniji set funkcija korisnicima koji žele imati bolju kontrolu nad svojim zdravljem - dodao je.\r\n\r\nŠto se dizajna tiče, kućište od nehrđajućeg čelika nadopunjeno je zakrivljenim 3D staklom s velikim ekranom, a sa satrane je i rotirajući kotačić koji omogućuje jednostavno upravljanje najvažnijim funkcijama i nudi taktilne povratne informacije.  HarmonyOS 2 također donosi posve novo korisničko sučelje s menijem aplikacije za pokretanje mreže koji nadopunjava 3D rotirajuću krunu, kako bi pružio ugodnije korisničko iskustvo.\r\n\r\nUz nove maske i remenje, jedna od najboljih opcija novog sata je eSIM podrška kojojm ćete moći biti potpuno neovisni od mobitela, a dolazi i s instaliranom AppGallery trgovinom pa ćete moći instalirati dodatne aplikacije.\r\n\r\nSatovi Watch 3 serije nude više od 100 režima vježbanja, a uz senzore za temperaturu i otkrivanje pada proširili su popis funkcija praćenja zdravlja. \r\n\r\nBaterija je i dosad bila jedan od aduta Huaweijevih sata, a Watch 3 u smart načinu može raditi 3 dana, 14 dana u ultra-long modu, dok kod Watch 3 Pro verzije sata to se može produljiti na 21 dan. Inače, sat dolazi u Active, Classic i Elite izdanju, dok HUAWEI WATCH 3 Pro dolazi u Classic i Elite izdanju.\r\n\r\nUz sat, neki dan je Huawei predstavio i FreeBuds 4 slušalice koje se odlikuju prvim adaptivnim aktivnim poništavanjem buke na svijetu.', 'huawei.jpg', 'tehnologija', 0),
(2, ' 5.6.2021.', 'Treće oko', 'Buljite u mobitel i ne gledate oko sebe?', 'Južnokorejski industrijski dizajner osmislio je satirično rješenje za \"smartphone zombije\" koji se ne mogu odvojiti od ekrana sve dok se ne zabiju u zid ili neki drugi objekt. \r\n\r\n28-godišnji Paeng Min-wook razvio je robotsko \"treće oko\" koje korisnici pametnih telefona mogu staviti na čelo i tako izbjeći ozljede tijekom kretanja. \r\n\r\nUređaj otvara prozirni kapak kada osjeti da je korisnikova glava spuštena i okrenuta prema zaslonu telefona. Kada je korisnik od prepreke udaljen jedan ili dva metra, uređaj odašilje zvučni signal upozorenja za nadolazeću opasnost.\r\n\r\n\"Ovo je budućnost čovječanstva s tri oka\", rekao je za Reuters Paeng, postdiplomski student inženjerskog dizajna za inovacije u Londonu, demonstrirajući korištenje trećeg oka u okolici Seula.\r\n\r\n\"S obzirom na to da ne možemo odvojiti pogled od pametnih telefona, u budućnosti ćemo trebati dodatno oko\", rekao je.', 'treceoko.jpg', 'tehnologija', 0),
(3, '1.6.2021.', 'Rimac Nevera', 'Rimac je predstavio novi auto, električnu zvijer od 1914 konja', 'Nikada u povijesti nije postojao automobil poput Rimac Nevere, potpuno električnog hiperautomobila sljedeće generacije koji otvara nove dimenzije u cestovnim performansama.\r\n\r\nS 1914 konjskih snaga iz četiri elektromotora, Nevera može ubrzati do 100 km/h za 1,85 sekundi, a do 100 milja na sat za samo 4,3 sekunde. Zapanjujuće ubrzavanje zadržava tijekom cijelog ciklusa punog gasa i dostiže 300 km/h od starta za 9,3 sekunde.\r\n\r\nNevera je proizvodna varijanta konceptnog automobila Rimac C_Two, prvi put prikazanog na Međunarodnom salonu automobila u Ženevi 2018. Od tada su inženjeri Rimac Automobila usavršavali svoj novi model na svim razinama tijekom opsežnog razvojnog programa, kako bi stvorili vrhunsko iskustvo vožnje električnog hiperautomobila.\r\n\r\nVećina ključnih komponenti Nevere razvijena je u sjedištu Rimca u Hrvatskoj, a svi su sustavi poboljšani i unaprijeđeni u odnosu na prve prototipe kako bi se postigli ambiciozni ciljevi postavljeni na početku projekta 2018. godine.\r\n\r\nS ponosom dizajnirana, razvijena i proizvedena u tvrtki Rimac Automobili u Hrvatskoj, Nevera nosi i hrvatsko ime koje uistinu odražava izvanredne performanse koje može osloboditi u tren oka.\r\n\r\nNevera je moćna mediteranska oluja, nabijena munjom, koja se pojavljuje iznimnom brzinom i snagom. Svojom iznimnom brzinom i snagom, Rimčev hiperautomobil s neverom dijeli ne samo ime, nego i narav. Poput prirodne sile po kojoj je nazvan, jednako je sposoban u trenu promijeniti narav od sigurnog i udobnog grand tourera do automobila visokih performansi.', 'nevera.jpg', 'auti', 0),
(4, '2.6.2021.', 'Zaradio sam 100.000 dolara na igricama', 'Domagoj Fancev (17) je s timom osvojio srebro na natjecanju VALORANT Champions Tour 2021', 'Ja sam Gordan, najponosniji otac u Hrvatskoj. Moj sin je drugi u svijetu, govori otac Domagoja Fanceva (17), člana petorke koja je u Hrvatsku donijela srebro s natjecanja VALORANT Champions Tour 2021: Stage 2 Masters. Sa svojih 17 godina, zarađuje i do 10.000 dolara mjesečno.\r\n\r\nDomagoj, inače učenik Trgovačko-ugostiteljske škole u Karlovcu, proveo je mjesec dana u Reykjaviku gdje se natjecao s najboljim natjecateljima u esportu.\r\n\r\nNjegova obitelj i prijatelji, njih 60-ak, unajmili su autobus kojim su se dovezli iz Karlovca na Zračnu luku “Dr. Franjo Tuđman”. Domagoj, naravno, za ništa od toga nije znao. Sa sobom su doveli i dva snimatelja, bend, navijačke rekvizite te zastave.\r\n\r\n- Pripremali smo se dva mjeseca. Na turniru u Islandu je nagradni fond bio 600.000 dolara, mi smo osvojili 100.000. Nisam ništa specijalno radio, igrao sam s ekipom - rekao je Domagoj.\r\n\r\nValorant je igrica koja se igra u dva tima po pet članova, spada u “pucačine”, a glavna vještina koju igrač mora imati je dobro taktiziranje.\r\n\r\n- Mečevi su trajali po dva i pol sata, a finale tri - objašnjava nam.\r\n\r\nDomagoj je inače samozatajan, a kad smo razgovarali s njim, bio je i u blagom šoku jer nije očekivao ovakav doček.\r\n\r\n- Unajmili smo autobus i dolazit ćemo po Domu uvijek s autobusom i glazbom. Mi smo takvi, volimo veselje. Doma nas je učinio jako ponosnima, on je ponos Karlovca - govori nam tata Gordan i dodaje: Moj sin je nosio hrvatsku zastavu s natpisom ‘Karlovac’ u finalu koje je gledalo tri i pol milijuna ljudi. Ovo je tek početak za njega. I samo me to zanima, nikakvi novci. Samo želim da moj sin uspije i da bude zadovoljan, a ja ću uvijek biti ponosan.\r\n\r\nNjegov sin je odmalena zainteresiran za igrice, a što je bio stariji, to su ozbiljnije igrice postajale zanimacija.\r\n\r\n- Kad sam imao 12 godina, iz dosade sam počeo igrati CSGO. Shvatio sam da sam jako dobar u tome pa sam s dva prijatelja stvorio tim. Prošli smo kroz nekoliko turnira i lani u prosincu bili drugi u Europi - objašnjava nam Domagoj.\r\n\r\nNakon tako velikog uspjeha, do kojeg su došli sami, primijetila ih je agencija Fnatic, koja ima sedam timova igrača za različite igrice.\r\n\r\n- To je britanska organizacija, oni se brinu o nama. Poslali su nam ponudu, mi smo potpisali i onda smo imali kratko jedan loši period. Izgubili smo neke bitne mečeve, ali smo promijenili ekipu i sad smo, evo, drugi na svijetu - priča nam.\r\n\r\nOno što je počelo iz dosade prije pet godina, mogla bi postati ozbiljna karijera.\r\n\r\n- Sad još ne razmišljam o tome na koji ću fakultet nakon srednje škole, koncentrirao sam se prvo na ovo. Mislim da ću i novce potrošiti na zabavu. Nisam kao mali razmišljao što želim biti, barem tako mislim - priča nam.', 'domagoj.jpg', 'tehnologija', 0),
(5, '10.6.2021.', 'Najimpresivniji Peugeot ikada', 'Novi 508 Peugeot Sport Engineered je najsnažniji i najbrži serijski cestovni peugeot u povijesti.', 'Iz odjela Peugeot Sport Engineered, specijaliziranog za sportske aute stigao nam je najimpresivniji cestovni Peugeot kojeg je ova tvrtka ikada proizvela. Peugeot 508 Peugeot Sport Engineered ima hibridni pogon i čak 360 KS što ga također čini najsnažnijim cestovnim Peugeotom u povijesti.\r\n\r\nKoliko auto atraktivno izgleda nije potrebno posebno isticati. Već \"obični\" 508 ima impresivan sportski dizajn, a kod ovog modela to je dovedeno na još višu razinu raznim praktičnim i estetskim ukrasima i ogromnim kotačima od 20\". \r\n\r\nPogon je sastavljen od tri motora. Benzinski ima 1,6 litara, turbo i već sam po sebi razvija 200 KS. Uz pomoć dva dva električna motora (110 KS sprijeda i 113 KS straga) pogonski sustav razvija ranije spomenutih 360 KS i 500 Nm okretnog momenta. \r\n\r\nUz toliku snagu performanse moraju biti spektakularne. Peugeot 508 PSE do 100 km/h ubrza za samo 5,2 sekunde, a maksimalna brzina mu je ograničena na 250 km/h.\r\n\r\nZbog hibridnog sustava auto može biti i vrlo štedljiv. Deklarirana potrošnja po WLTP-u je samo dvije litre na 100 kilometara. Naravno pod uvjetom da vožnja nježna,a baterija puna. ', 'peugeot.jpg', 'auti', 0),
(6, '20.5.2021.', 'Toyota C-HR', 'Toyota C-HR s trunkom agresive iz auta svjetskog rally prvaka', 'Njegovo ime zvuči impresivno. G-HR GR Sport.  Ljubitelji automobila znaju što može i zna Toyotin sportski odjel GR što je skraćenica za Gazoo Racing. Japanski genijalci napravili su WRC auto u kojem su u prošle dvije godine Sebastien Ogier i Ott Tanak osvajali svjetska prvenstva, a napravili su i cestovni Yaris kojeg mnogi trenutno smatraju najboljim malim sportskim autom na svijetu. \r\n\r\nNo moramo vas razočarati GR Sport je u ovom autu samo oznaka opreme. Ovaj C-HR je klasičan Toyotin hibrid, a ne sportski auto. Iako može biti prilično zabavan i vrlo brz.\r\n\r\nOprema GR Sport se odnosi uglavnom na unutrašnjost automobila. Izvana ona donosi samo ogromne sportske naplatke od 19\" sa širokim gumama i kompletna LED prednja i stražnja svjetla. Iznutra imamo sportski upravljač, sportska sjedala i mnoge druge sportske ukrase. Nekakvih zahvata na ovjesu i drugim detaljima koji bi utjecali na vozne osobine oprema GR Sport ne donosi.\r\n\r\nMala trunka agresive iz naslova odnosi se dakle samo na izgled. Iako i pogon C-HR-a \"nije za baciti\". Riječ je o snažnom hibridnom sustavu kojeg je moguće dobiti i uz druge pakete opreme. On se sastoji od benzinskog motora obujma dvije litre koji razvija 152 KS i dodatnog električnog motora.\r\n\r\nUkupna snaga sustava je 184 KS, a to garantira sasvim dobre performanse. Ubrzanje do 100 km/h traje 8,2 sekunde, što je na granici sa sportskim vrijednostima, no međuubrzanja su još impresivnija. Ovaj C-HR se može voziti itekako dinamično. Maksimalna brzina pak nije impresivna. Ona je kao na drugim hibridnim Toyotama ograničena. Ovdje na 180 km/h.', 'toyota.jpg', 'auti', 0),
(7, ' 15.5.2021.', 'Wolkswagen', 'VW je brzo naučio, novi ID.4 je jedan od najboljih električnih auta današnjice', 'Da ne bi bilo zabune, ID modeli nisu prvi električni Volkswageni. Daleko od toga. Volkswagen  zapravo ima vrlo bogatu električnu tradiciju. \r\n\r\nMalo je poznato da je VW proizveo, doduše u vrlo limitiranim brojkama, električnu verziju Golfa jedinice još u sedamdesetima, a tradicija se nastavila i s drugom te s trećom generacijom Golfa. Dakle, Volkswagen je zapravo bio jedan od pionira moderne elektromobilnosti. \r\n\r\nMnogo bolje je poznato da Volkswagen od 2013. proizvodi moderne električne automobile, e-Up! i Golfa: To su prilično dobri i iskoristivi električni auti, no realno konkurencija je u Međuvremenu otišla mnogo dalje. Zato je Volkswagen prije nekoliko godina pokrenuo veliku električnu ofenzivu. Rezultat toga su ID modeli koji polako dolaze na tržište. Već smo ranije isprobali ID.3 koji se pokazao vrlo dobrim, a sada nam je na test stigao ID4 koji nas je oduševio.\r\n\r\n\"Dječje bolesti\" koje je pokazivao ID.3 kod ID.4 su potpuno \"izliječene\" i ovaj kompaktni SUV pokazao  se jednim od najboljih električnih automobila koje trenutno možete kupiti. Njegove vozne osobine impresioniraju jednako kao i doseg koji omogućuje popriličnu fleksibilnost i slobodu.', 'vw.jpg', 'auti', 0),
(8, '28.5.2021.', 'Nestašica čipova', 'HP je priopćio da će nestašica ograničiti njegovu mogućnost isporuka potrošačke elektronike barem do kraja godine', 'Tehnološke kompanije Dell i HP izvijestile su o kvartalnim prihodima koji su nadmašili procjene Wall Streeta, jer su potrošači nastavili kupovati osobna računala, čak i kad su u mnogim dijelovima svijeta ograničenja za suzbijanje pandemije ublažena.\r\n\r\nMeđutim, dionice Della i HP-a pale su za jedan odnosno čak šest posto, nakon što su obje kompanije upozorile da bi nestašica računalnih čipova mogla utjecati na njihovu sposobnost da ove godine podmire potražnju za prijenosnim računalima.\r\n\r\n\"Zalihe i raspoloživost dijelova i dalje su ograničeni\", rekao je glavni financijski direktor Della Thomas Sweet dodajući kako će sve veći troškovi nabave tih čipova utjecati na operativne prihode u tekućem kvartalu te dovesti do blago nižeg prihoda.\r\n\r\nHP, koji prema podacima američke istraživačke tvrtke IDC zauzima drugo mjesto među globalnim dobavljačima računala, priopćio je da će nestašica ograničiti njegovu mogućnost isporuka potrošačke elektronike barem do kraja godine.\r\n\r\nIpak, obje kompanije očekuju rast na cijelom tržištu, jer će se povećati potražnja za prijenosnim računalima, koja su potrebna u školama i radu na daljinu.\r\n\r\nPrema podacima IDC-a, globalne isporuke osobnih računala porasle su tijekom prvog tromjesečja za 55,2 posto.\r\n\r\nDell je priopćio da je prihod od odjela Client Solutions, koji uključuje stolna računala, prijenosna računala i tablete, porastao za 20 posto, na 13,31 milijardu dolara na kvartalnoj razini.\r\n\r\nHP-ova prodaja računala porasla je za 27 posto u tromjesečju koje je završilo 30. travnja, dok je prodaja prijenosnih računala porasla za 47 posto u odnosu na isto razdoblje godinu ranije.', 'cipovi.jpg', 'tehnologija', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
