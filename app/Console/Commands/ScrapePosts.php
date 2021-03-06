<?php

namespace App\Console\Commands;
use Goutte\Client;
use Carbon\Carbon;
use App\Posts;
use DB;

use Illuminate\Console\Command;

class ScrapePosts extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'posts:scrape';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
      $client = new Client();
      $crawler = $client->request('GET', 'http://claremontindependent.com/category/campus-news/');
      $status_code = $client->getResponse()->getStatus();
      if($status_code==200) {
          echo '200 OK<br>';
      }
      $crawler->filter('div.site-content article')->each(function ($node) {
        $url =  $node->filter('a.post-thumbnail')->attr('href'); //url
        $imgUrl = $node->filter('a.post-thumbnail img')->attr('src'); //imgUrl
        $title = $node->filter('header h1')->text(); //title
        $date = substr($node->filter('header div.entry-meta span.entry-date time')->attr('datetime'), 0, 10); //date
        $author = $node->filter('header div.entry-meta span.byline span.author a')->text(); //author
        $description = substr(mb_convert_encoding($node->filter('div.entry-content p')->text(), "HTML-ENTITIES", "UTF-8"), 0, 500); //description

        $id = getArticleId($date);

        if (Posts::where('title', '=', $title)->exists()) {
          echo $title." already exists";
        }
        else {
          $post = new Posts;
          $post->article_id = $id;
          $post->author = $author;
          $post->title = $title;
          $post->description = $description;
          $post->imgUrl = $imgUrl;
          $post->url = $url;
          $post->source = 'Claremont Independent';
          $post->save();
          echo "stored ".$title."!";
        }
      });

      $client = new Client();
      $crawler = $client->request('GET', 'http://www.thegoldenantlers.com/');
      $status_code = $client->getResponse()->getStatus();
      if($status_code==200) {
          echo '200 OK<br>';
      }

      $count = 0;
      $crawler->filter('div.bl_posts_information')->each(function ($node, $count) {
        if($count == 0){
          $node->filter('article')->each(function ($node1) {
          $author = ucwords(str_replace('-', ' ', $node1->attr('data-categoryslug'))); //author
          $url = $node1->filter('div.post-image a')->attr('href'); //url
          $imgUrl = $node1->filter('div.post-image img')->attr('src'); //imgUrl
          $date = $node1->filter('div.post-image div.meta-info div.info-date time')->attr('datetime'); //date
          $date = substr(createDateAntlers($date), 0, 10);
          $title = $node1->filter('div.post-body h3')->text(); //title
          $description = str_replace("CONTINUE READING", "", trimWhiteSpace(str_replace("&nbsp;", "", mb_convert_encoding($node1->filter('div.post-body div.post-content p')->text(), "HTML-ENTITIES", "UTF-8")))); //description
          $id = getArticleId($date);

          if (Posts::where('title', '=', $title)->exists()) {
            echo $title." already exists";
          }
          else {
            $post = new Posts;
            $post->article_id = $id;
            $post->author = $author;
            $post->title = $title;
            $post->description = $description;
            $post->imgUrl = $imgUrl;
            $post->url = $url;
            $post->source = 'The Golden Antlers';
            $post->save();
            echo "stored ".$title."!";
          }
          });
        }
        $count++;
      });

      $client = new Client();
      $crawler = $client->request('GET', 'http://cmcforum.com/');
      $status_code = $client->getResponse()->getStatus();
      if($status_code==200) {
          echo '200 OK<br>';
      }
      $count = 0;
      $crawler->filter('div.td-big-grid-wrapper div.td-big-grid-post')->each(function ($node, $count) {
        if($count == 0) {
          $url = $node->filter('div.td-module-thumb a')->attr('href'); //url no clean
          $imgUrl = $node->filter('a img')->attr('src'); //imgUrl no clean
          $title = $node->filter('div.td-big-grid-meta h3 a')->text(); //clean title
          $date = substr($node->filter('div.td-big-grid-meta div.td-module-meta-info div.td-post-date time')->attr('datetime'), 0, 10); //date clean
          $author = $node->filter('div.td-big-grid-meta div.td-module-meta-info div.td-post-author-name a')->text(); //author clean
          $client2 = new Client();
          $crawler2 = $client2->request('GET', $url);
          $description = $crawler2->filter('div.td-post-content p')->text();

          $id = DB::table('email_articles')->where('post_date', $date)->value('article_id');
          if (Posts::where('title', '=', $title)->exists()) {
            echo $title." already exists";
          }
          else {
            $post = new Posts;
            $post->article_id = $id;
            $post->author = $author;
            $post->title = $title;
            $post->description = $description;
            $post->imgUrl = $imgUrl;
            $post->url = $url;
            $post->source = 'The Forum';
            $post->save();
            echo "stored ".$title."!";
          }
        }
        $count++;
      });
    }
}
