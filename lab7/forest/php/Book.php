<?php

include 'BookEntry.php';

class Book {
    private $servername = "localhost";
    private $username = "root";
    private $password = "";
    private $dbname = "forest_php";

    function getTable() {
        $conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT * FROM book_entry";
        $result = $conn->query($sql);

        $table = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $entry = new BookEntry($row["id"], $row["author"], $row["title"], $row["comment"], $row["date"]);
                $table[$row["id"]] = $entry;
            }
        }
        $conn->close();
        return $table;
    }

    function insertEntry(BookEntry $entry) {
        $conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $author = $entry->getAuthor();
        $title = $entry->getTitle();
        $comment = $entry->getComment();
        $date = $entry->getDate();

        $stmt = $conn->prepare("INSERT INTO book_entry (author,title,comment,date) VALUES (?, ?, ?, ?);");
        $stmt->bind_param('ssss', $author, $title, $comment, $date);
        //var_dump($stmt);
        $stmt->execute();
    }

    function editEntry(BookEntry $entry) {
        $conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "UPDATE book_entry SET
            author = '" . $entry->getAuthor() .
            "', title = '" . $entry->getTitle() .
            "', comment = '" . $entry->getComment() .
            "', date = '" . $entry->getDate() .
        "'  where id = " . $entry->getId();
        $result = $conn->query($sql);
    }

    function deleteEntry($id) {
        $conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "DELETE FROM book_entry WHERE id=" . $id;
        $conn->query($sql);
    }
}
