<?php
session_start();
?>
<html>
<head>
	<link type="text/css" rel="stylesheet" href="style2.css"/>
	<title>Thousands of links</title>
	<script src="jquery-1.11.3.js"></script>
	<script type='text/javascript' src='common.js'></script>
<script type='text/javascript' src='css.js'></script>
<script type='text/javascript' src='standardista-table-sorting.js'></script>
    <script>
        function showUser(str) {
            if (str == "") {
                document.getElementById("txtHint").innerHTML = "";
                return;
            } else {
                if (window.XMLHttpRequest) {
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {
                    // code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET","getEntry.php?q="+str,true);
                xmlhttp.send();
            }
        }
    </script>
</head>
<body>
<h2>Guest Book</h2>
<form action="addEntry.php" method="get" >
    <table>
        <tr><td>Author:</td><td><input type="email" name="author"</td></tr>
        <tr><td>Title:</td><td><input type="text" name="title"></td></tr>
        <tr><td>Comment:</td><td><input type="text" name="comment"></td></tr>
        <tr><td>Date:</td><td><input type="date" name="date"></td></tr>
    </table>
	<input type="submit">
    
	
</form>
<form>
    <select name="users" onchange="showUser(this.value)">
        <option value="">Select an entry:</option>
        <option value="10">Test</option>
        <option value="14">dasfj</option>
        <option value="20">Google</option>
    </select>
</form>
<br>
<div id="txtHint"><b>Person info will be listed here...</b></div>
<?php



    if ($_SESSION['admin'] == 'false') {
        echo "<form action='makeMeAdmin.php' method='get'><input type='submit' value='Make me Admin'></form>";
    } else {
        include 'Book.php';

        $book = new Book();
//$entry = new BookEntry('ceapa','verde','nasol','2009-04-30');
//$book->insertEntry($entry);

        echo "<form action='makeMeUser.php' method='get'><input type='submit' value='Make me User'></form>";

if (!isset($_GET['select-author']) || $_GET['select-author'] == "") {
    displayTable($book->getTable());
}
        else {
            displayTable2($book->getTable());
        }


    }
    function displayTable($table)
    {
        if (count($table)) {
            echo "<table cellspacing=\"1\" id=\"tableid\" class=\"sortable\">";
            echo "<thead><tr>
    <th>Author</th> 
    <th>Title</th> 
    <th>Comment</th> 
    <th>Date</th> 
	<th>Edit</th> 
	<th>Delete</th> 
</tr> 
</thead> <tbody>";
            foreach ($table as $entry) {
                if ($entry instanceof BookEntry) {
                    echo "<tr>";
                    echo "<td>" . $entry->getAuthor() . "</td>";
                    echo "<td>" . $entry->getTitle() . "</td>";
                    echo "<td>" . $entry->getComment() . "</td>";
                    echo "<td>" . $entry->getDate() . "</td>";
                    echo "<td><a href='edit.php?id=" . $entry->getID() .
                        "&author=" . $entry->getAuthor() . "&title=" . $entry->getTitle() . "&comment=" .
                        $entry->getComment() . "&date=" . $entry->getDate() . "'>Edit</a></td>";

                    echo "<td><a href='deleteEntry.php?id=" . $entry->getID() . "'>Delete</a></td>";
                    echo "</tr>";
                }
            }
            echo "</tbody></table>";
        } else {
            echo 'No entries in book.';
        }
    }

function displayTable2($table)
{
    if (count($table)) {
        echo "<table cellspacing=\"1\" id=\"tableid\" class=\"sortable\">";
        echo "<thead><tr>
    <th>Author</th>
    <th>Title</th>
    <th>Comment</th>
    <th>Date</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
</thead> <tbody>";
        foreach ($table as $entry) {
            if ($entry instanceof BookEntry && $entry->getAuthor() == $_GET['select-author']) {
                echo "<tr>";
                echo "<td>" . $entry->getAuthor() . "</td>";
                echo "<td>" . $entry->getTitle() . "</td>";
                echo "<td>" . $entry->getComment() . "</td>";
                echo "<td>" . $entry->getDate() . "</td>";
                echo "<td><a href='edit.php?id=" . $entry->getID() .
                    "&author=" . $entry->getAuthor() . "&title=" . $entry->getTitle() . "&comment=" .
                    $entry->getComment() . "&date=" . $entry->getDate() . "'>Edit</a></td>";

                echo "<td><a href='deleteEntry.php?id=" . $entry->getID() . "'>Delete</a></td>";
                echo "</tr>";
            }
        }
        echo "</tbody></table>";
    } else {
        echo 'No entries in book.';
    }
}


?>
<script>
    $(document).ready(function(){
        $("#button").click(function() {
            // parameter name: "test" from the ajax call is not actually used
            $.get("index.php", {author : $'select-author'},
                function(data,status) {
                    $("#maindiv").html(data);
                });
        });
    });
</script>
<script src="jaffa.js"></script>
</body>
</html>