<?php
global $lot_jackpot, $template_dir;
$Jkpot = number_format($lot_jackpot,0,'.','');
?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://vjs.zencdn.net/5.8.8/video-js.css" rel="stylesheet">
<link href="http://promotions.lottosix.com/wp-content/themes/lottolp/assets/common/css/videojs-sublime.css" rel="stylesheet">
<!-- If you'd like to support IE8 -->
<script src="http://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
<div class="top clearfix">
    <div class="wrapper">
        <a href="https://www.lottosix.com/"><img src="<?php echo $template_dir ?>/img/logo.jpg" class="logo" alt=""></a>
    </div>
</div>
<div class="cont">
    <div class="wrapper">
        <div class="header clearfix">
            <div class="top-text">
                <h1>Play the biggest running official lottery in the world</h1>
            </div>
            <a href="https://www.lottosix.com/play-PowerBall" class="logo-header"><img src="<?php echo $template_dir ?>/img/logo.png" alt=""></a>
            <div class="right-header-block">
                <!-- <h1>$168,000,000</h1> -->
                <!-- <h1>$<?php echo $lot_jackpot; ?></h1> -->
                <h1>$<?php echo $Jkpot; ?>,000,000</h1>
                <div class="right-buttom clearfix">
                    <a href="https://www.lottosix.com/play-PowerBall"><img src="<?php echo $template_dir ?>/img/button3.png" alt="Play Powerball"></a>
                    <!--<p class="title">GET a FREE TICKET</p>
                    <div class="info clearfix">
                        <span class="icon"></span>
                        <p class="center-text">Upon your first purchase of an <br>
                            official lottery ticket through</p>
                        <span class="icon-right"></span>
                    </div>-->
                </div>
            </div>
            <div class="block-timer">
                <p class="title-t">Time to draw:</p>
                <div class="timer">
                    <!-- <p>2 Days 13:03:38</p> -->
                    <p id="counter_days1"></p>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="boxes clearfix">
                <div class="box bg1">
                    <div class="title clearfix">
                        <h1>View your lottery ticket </h1>
                        <p class="text-box">View, save and print a scanned copy of <br>
                            your ticket for firm verification</p>
                    </div>
                </div>
                <div class="box bg2">
                    <div class="title">
                        <h1>It’s easy!</h1>
                        <p class="text-box">“Buying an official <br>
                            lottery ticket online <br>
                            is quick & simple”</p>
                        <p class="sub-text">Astrid van Kleef, Sweden. <br>
                            won <b>$100</b> on Dec 8th <br>
                            U.S.A Powerball</p>
                    </div>
                    <div class="block-img">
                        <img src="<?php echo $template_dir ?>/img/img1.png" class="img1" alt="">
                    </div>
                </div>
                <div class="box bg3">
                    <div class="title">
                        <h1>How to play</h1>
                    </div>
                    <p class="list"><span class="icon1">1</span>Click the yellow <br>
                        “Get a Free Ticket” button</p>
                    <p class="list2"><span class="icon1">2</span>Pick your lucky numbers</p>
                    <p class="list3"><span class="icon1">3</span>GoodLuck!</p>
                </div>
            </div>
            <div class="video-bar clearfix">
                <div class="left-side">
                    <div class="clearfix top-b">
                        <p>Watch KTVZ</p>
                    </div>
                    <div class="content">
                        <p class="text1">LottoSix Client Wins 6.4M</p>
                        <img src="<?php echo $template_dir ?>/img/img2.png" class="img2" alt="">
                        <p class="text3">Wanda Moore covers the 6.4 Million
                            Dollar Oregon lottery winning, made
                            possible by LottoSix. Our unique service
                            make the unimaginable a reality and
                            make your dreams come true  –
                            Collect winnings from lotteries around
                            the globe, wherever you might be.” </p>
                    </div>
                </div>
                <div class="video">
                    <!-- <iframe  src="https://www.youtube.com/embed/X8Z8okhkjv8" frameborder="0" allowfullscreen></iframe> -->
                      <video id="my-video" class="video-js vjs-sublime-skin" controls autoplay preload="auto" width="644" height="358"  data-setup='{"aspectRatio":"644:358" }'>
                            <source src="http://bunocdn-bwh7c29549e.bwhog.net/LottoSix/Iraqi%20National%20Wins%20Oregon%20Lottery-1.mp4?v=2" type='video/mp4'>
                            <p class="vjs-no-js">
                              To view this video please enable JavaScript, and consider upgrading to a web browser that
                              <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                            </p>
                      </video>
               </div>
            </div>
        </div>
    </div>
</div>
<div class="footer clearfix">
    <div class="wrapper">
        <div class="nav">
            <ul class="clearfix">
                <li><a href="https://www.lottosix.com/about-us" target="_blank">About us</a></li>
                <li><a href="https://www.lottosix.com/contact-us" target="_blank">Contact us</a></li>
                <li><a href="https://www.lottosix.com/help/faq" target="_blank">FAQ</a></li>
            </ul>
        </div>
        <img src="<?php echo $template_dir ?>/img/footer-icon.png" class="icon-footer" alt="">
    </div>
</div>

 <script src="http://vjs.zencdn.net/5.8.8/video.js"></script>
 <script>
videojs("my-video").ready(function(){
  var myPlayer = this;
  myPlayer.play();
});
</script>