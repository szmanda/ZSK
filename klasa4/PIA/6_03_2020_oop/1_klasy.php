<?php
  class Person{
    private $name;

    public function setName($name)
    {
      //$this->name="Anna";
      $this->name = $name;
    }
    public function getName()
    {
      return $this->name;
    }
  }
  $obj = new Person();
  echo getName();

  $obj->name = "Janusz"
  echo getName();
  $obj->setName("Krystyna");
  echo getName();


 ?>
