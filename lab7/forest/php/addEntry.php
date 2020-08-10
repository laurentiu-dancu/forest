<?php
include 'Book.php';

$book = new Book();
$entry = new BookEntry(0, $_GET["author"], $_GET["title"], $_GET["comment"], $_GET["date"]);
$book->insertEntry($entry);
header("Location: index.php");
die;