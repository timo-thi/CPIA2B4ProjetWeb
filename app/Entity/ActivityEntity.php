<?php
namespace App\Entity;


use Core\Entity\Entity;


class ActivityEntity extends Entity {
	
    public function in_array(array $var) {
        foreach ($var as $va){
            if($va->id_activity == $this->id_activity) {
            return true;
            }
        }
        return false;
    }
}