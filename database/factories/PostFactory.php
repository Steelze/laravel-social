<?php

use Faker\Generator as Faker;

$factory->define(App\Post::class, function (Faker $faker) {
    return [
        'status' => $faker->text($maxNbChars = 100),
    ];
});
