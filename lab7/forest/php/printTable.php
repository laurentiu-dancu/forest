<?php

include 'Book.php';

$book = new Book();
//$entry = new BookEntry('ceapa','verde','nasol','2009-04-30');
//$book->insertEntry($entry);

displayTable($book->getTable());


function displayTable($table) {
    if(count($table)) {
        echo "<table>";
        foreach($table as $entry) {
            if($entry instanceof BookEntry) {
                echo "<tr>";
                echo "<td>" . $entry->getAuthor() . "</td>";
                echo "<td>" . $entry->getTitle() . "</td>";
                echo "<td>" . $entry->getComment() . "</td>";
                echo "<td>" . $entry->getDate() . "</td>";

                echo "</tr>";
            }
        }
        echo "</table>";
    }
    else {
        echo 'No entries in book.';
    }
}