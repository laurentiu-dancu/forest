<?php
include 'Book.php';

$book = new Book();
$book->deleteEntry($_GET['id']);
header("Location: index.php");
die;
