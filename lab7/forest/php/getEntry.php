<!DOCTYPE html>
<html>
<body>

<?php
include 'BookEntry.php';
$q = intval($_GET['q']);

$con = mysqli_connect('localhost','root','','forest_php');
if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
}

mysqli_select_db($con,"ajax_demo");
$sql="SELECT * FROM book_entry WHERE id = '".$q."'";
$result = mysqli_query($con,$sql);

echo "<table>
<tr>
<th>Author</th>
<th>Title</th>
<th>Comment</th>
<th>Date</th>
</tr>";
while($row = mysqli_fetch_array($result)) {

    $entry = new BookEntry($row["id"], $row["author"], $row["title"], $row["comment"], $row["date"]);
    echo "<tr>";
    echo "<td>" . $entry->getAuthor() . "</td>";
    echo "<td>" . $entry->getTitle() . "</td>";
    echo "<td>" . $entry->getComment() . "</td>";
    echo "<td>" . $entry->getDate() . "</td>";
    echo "</tr>";
}
echo "</table>";
mysqli_close($con);
?>
</body>
</html>