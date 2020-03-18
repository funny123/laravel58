<?php
class Solution {

    /**
     * @param Integer $tomatoSlices
     * @param Integer $cheeseSlices
     * @return Integer[]
     */
    function numOfBurgers($tomatoSlices, $cheeseSlices) {
        $x = 0;
        $y = 0;
        $result = [];
        if($tomatoSlices%($x+$y)==0&&$cheeseSlices%($x+$y)==0){
            return $x;
        }
    }
}
$app = new Solution();
echo $app->numOfBurgers(16,7);