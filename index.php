<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mini social network </title>
    <style>
        body {
            background-color: beige;
        }

    </style>
</head>
<body>
<?php
$user = 'root';
$pass = '';
$db = 'social_network';

$conn= new mysqli('localhost', $user, $pass, $db) or die("Connection failed");
$upit= "SELECT * FROM social_network ORDER BY id ASC";
$result= mysqli_query($conn, $upit);


?>
<form action="index.php" method="GET">
    Choose user: <select name="person" >
        <?php
        while($row= mysqli_fetch_assoc($result)) {
        ?>
        <option value=
                 "<?php echo $row["id"] ?>"><?php     echo $row["firstName"]. " ". " ".  $row["surname"] . "<br>";
        ?>
            <?php }?>
        </option>
    </select>
    <input type="submit">
</form>
<?php

?>
<br> <br>
<?php
$user = 'root';
$pass = '';
$db = 'social_network';

$conn= new mysqli('localhost', $user, $pass, $db) or die("Nemoguca konekcija");
if(isset($_GET["person"]) && !empty($_GET["person"])) {
    $pers = $_GET["person"];
    echo "<br>";

    $query = "SELECT firstName, surname FROM social_network WHERE id = $pers ";
//query for friends
    $query2 = "SELECT id, firstName, surname FROM social_network WHERE id in (SELECT id FROM friends WHERE id_prijatelja=$pers)
";
//query for friends of friends
    $query3 = "SELECT id, firstName, surname FROM social_network WHERE id in (SELECT id FROM friends WHERE id_prijatelja in (SELECT id FROM friends WHERE id_prijatelja=$pers)) AND id not in (SELECT id FROM friends WHERE id_prijatelja=$pers)
";
    $result = mysqli_query($conn, $query);

    while ($row = mysqli_fetch_assoc($result)) {
        echo " First name: " . $row["firstName"] . " Surname: " . $row["surname"] . "<br>";
    }
    echo "<br>";
    echo "Friends:  <br>";

    $result2 = mysqli_query($conn, $query2);

    while ($row2 = mysqli_fetch_assoc($result2)) {
        if($row2["id"]==$pers) {
            echo " ";

        }
        else {
            echo  "id: " . $row2["id"] . " - Name: " . $row2["firstName"] . " " . $row2["surname"] .  "<br>";
        }
    }
    $result3 = mysqli_query($conn, $query3);
    echo "<br>";
    echo "Friends of friends: ";
    echo "<br>";
    while ($row3 = mysqli_fetch_assoc($result3)) {
        if($row3["id"]==$pers) {
            echo " ";

        }
        else {
            echo "id: " . $row3["id"] . " - Name: " . $row3["firstName"] . " " . $row3["surname"] . "<br>";
        }
    }
    echo "<br>";
    echo "<br>";
    echo "Suggestion: ";
    echo "<br>";

    //query for friend suggestions
    $query4="SELECT social_network.id, social_network.firstName,social_network.surname ,COUNT(social_network.id) as broj FROM social_network INNER JOIN friends ON social_network.id = friends.id WHERE friends.id_prijatelja IN (SELECT friends.id FROM friends WHERE id_prijatelja=$pers AND social_network.id NOT in (SELECT friends.id FROM friends where friends.id_prijatelja=$pers)) GROUP BY social_network.firstName, social_network.surname HAVING broj>=2";
    $result4=mysqli_query($conn,$query4);
    while ($row4 = mysqli_fetch_assoc($result4)) {
        if($row4["id"]==$pers) {
            echo " ";

        }
        else {
            echo "id: " . $row4["id"] . " - Name: " . $row4["firstName"] . " " . $row4["surname"] . "<br>";
            echo "Number of mutual friends: " . $row4["broj"] . "<br>";
        }
    }
}
?>
</body>
</html>

