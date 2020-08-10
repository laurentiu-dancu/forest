<?php
include 'Book.php';

$book = new Book();
$entry = new BookEntry($_GET["id"], $_GET["author"], $_GET["title"], $_GET["comment"], $_GET["date"]);
$book->editEntry($entry);
header("Location: index.php");
die;