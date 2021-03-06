<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDiningHallFoodTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('dining_hall_food', function (Blueprint $table) {
        $table->increments('food_id');
        $table->integer('store_id');
        $table->integer('article_id');
        $table->string('foodName');
        $table->string('meal');
        $table->timestamps();
      });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::drop('dining_hall_food');
    }
}
