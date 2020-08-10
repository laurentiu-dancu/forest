<html>
<head>
<link type="text/css" rel="stylesheet" href="style2.css"/>
</head>
<body>
<form action="editEntry.php" method="get">
    <table>
        <tr><td>ID:</td><td><input type="number" name="id" value="<?php echo $_GET["id"]?>" readonly></td></tr>
        <tr><td>Author:</td><td><input type="text" name="author" value="<?php echo $_GET["author"] ?>"></td></tr>
        <tr><td>Title:</td><td><input type="text" name="title" value=<?php echo $_GET["title"] ?>></td></tr>
        <tr><td>Comment:</td><td><input type="text" name="comment" value=<?php echo $_GET["comment"] ?>></td></tr>
        <tr><td>Date:</td><td><input type="date" name="date" value=<?php echo $_GET["date"] ?>></td></tr>
    </table>
    <input type="submit" value="Edit">
</form>
</body>
</html>
