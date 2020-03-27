<?php
class Animal{
  public $species;
  public $genus;
  public $family;
  public $order;
  public $class;
  public $phylum;
  function __construct($phylum,$class,$order,$family,$genus,$species){
    $this->phylum = $phylum;
    $this->class = $class;
    $this->order = $order;
    $this->family = $family;
    $this->genus = $genus;
    $this->species = $species;
  }
  function ShowAll(){
    echo <<< ERT
    _________________________________<br>
    Kingdom:	Animalia<br>
    Phylum:	$this->phylum<br>
    Class:	$this->class<br>
    Order:	$this->order<br>
    Family:	$this->family<br>
    Genus:	$this->genus<br>
    Species:	$this->species<br>
    _________________________________<br><br>
ERT;
  }
};
 ?>
