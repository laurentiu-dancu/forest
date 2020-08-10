<?php


class BookEntry
{
    private $id;
    private $author;
    private $title;
    private $comment;
    private $date;

    function __construct($id, $author, $title, $comment, $date) {
        $this->id = $id;
        $this->author = $author;
        $this->title = $title;
        $this->comment = $comment;
        $this->date = $date;
    }

    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function getAuthor() {
        return $this->author;
    }

    public function setAuthor($author) {
        $this->author = $author;
    }

    public function getTitle() {
        return $this->title;
    }

    public function setTitle($title) {
        $this->title = $title;
    }

    public function getComment() {
        return $this->comment;
    }

    public function setComment($comment) {
        $this->comment = $comment;
    }

    public function getDate() {
        return $this->date;
    }

    public function setDate($date) {
        $this->date = $date;
    }
}