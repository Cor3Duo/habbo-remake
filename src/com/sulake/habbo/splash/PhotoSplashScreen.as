package com.sulake.habbo.splash
{
  import flash.display.Sprite;
  import flash.display.DisplayObjectContainer;
  import flash.display.Bitmap;

  public class PhotoSplashScreen extends Sprite
  {
    [Embed(source="/assets/splash_bg.png")]
    private var splashBgClass:Class;
    [Embed(source="/assets/splash_top.png")]
    private var splashTopClass:Class;
    [Embed(source="/assets/userphoto_1.png")]
    private var splashImg1:Class;
    [Embed(source="/assets/userphoto_2.png")]
    private var splashImg2:Class;

    public function PhotoSplashScreen(param1:DisplayObjectContainer)
    {
      // splashImg3 = §userphoto_3_png$b51730fba4bf1d05cc32fd18a18ca9f4-97070875§;
      // splashImg4 = §userphoto_4_png$78e97ef848421e251726fee4afb2473a-96916634§;
      // splashImg5 = §userphoto_5_png$8290aa0cebb5a0e5f12bff508d35b955-99941401§;
      // splashImg6 = §userphoto_6_png$46ee8945b9f2d4717e974b7bf880848a-98756000§;
      // splashImg7 = §userphoto_7_png$c609a45125801626e60ab38c065d9200-93359391§;
      // splashImg8 = §userphoto_8_png$78ce6ea691af8b85548def11d58acbf5-93237918§;
      // splashImg9 = §userphoto_9_png$20048192e570e61356072b9eca190d30-96229917§;
      // splashImg10 = §userphoto_10_png$a6cecfad3ec1184acd8a3dc85128512a-1232833997§;
      // splashImg11 = §userphoto_11_png$4b60ecb7dfddec8af8f2a8cd20f00eba-1231664564§;
      // splashImg12 = §userphoto_12_png$a38bde397ea3f5bc50e19a8ce2ba4db8-1231510835§;
      // splashImg13 = §userphoto_13_png$b3bc4ab23c6c91324461a4b1eb930e1d-1226130098§;
      // splashImg14 = §userphoto_14_png$9df1fe61af425d188526062daae5ed31-1224960561§;
      // splashImg15 = §userphoto_15_png$3ceb9d73ff982e75f20da917789ff7f9-1227953080§;
      // splashImg16 = §userphoto_16_png$bf34a4149a76aa830b227dc23c7437e3-1227832119§;
      // splashImg17 = §userphoto_17_png$dc08684bc47fe3156296fe1e9d4f79de-1239228598§;
      // splashImg18 = §userphoto_18_png$7ec284b155a067abba4c3411bd4ed487-1238026293§;
      // splashImg19 = §userphoto_19_png$a817a5baf9b3ebf581906b42eb22cc72-1241051580§;
      // splashImg20 = §userphoto_20_png$d3d120528593c4a8a6e4ffbf86cb7a88-1250882734§;
      // splashImg21 = §userphoto_21_png$3adaac9226fbdf35e1d1718b33b87858-1253874733§;
      // splashImg22 = §userphoto_22_png$007be0c8a58a020bf4df2e7c2c585bed-1252689300§;
      // splashImg23 = §userphoto_23_png$eedbb904f3d8c0f45230629124f4055a-1264102675§;
      // splashImg24 = §userphoto_24_png$abfd453da5435f619954d4c844a19a29-1263948434§;
      // splashImg25 = §userphoto_25_png$89bf9ce7be2aa258b97c0355d651f325-1262778897§;
      // splashImg26 = §userphoto_26_png$7ac7732aa408e55ba231ce026a8e5e49-1265787800§;
      // splashImg27 = §userphoto_27_png$b26b015da87e6b9faea24a041ab10a89-1264585495§;
      // splashImg28 = §userphoto_28_png$ecb3ea215e9527f040d2976dcccbff61-1260269718§;
      // splashImg29 = §userphoto_29_png$e8101c9db79869435c9a788a324c0fc7-1259329557§;
      // splashImg30 = §userphoto_30_png$bc53ce024355fb2eff0f331c42bb5d13-1289084687§;
      super();
      var _loc3_:Bitmap = null;
      var _loc2_:Vector.<Bitmap> = new Vector.<Bitmap>(0);
      _loc3_ = new splashBgClass() as Bitmap;
      _loc2_.push(_loc3_);
      // var _loc4_:Class = this["splashImg" + (int(1 + Math.floor(Math.random() * 30)))] as Class;
      var _loc4_:Class = this["splashImg" + (int(1 + Math.floor(Math.random() * 2)))] as Class;
      if (_loc4_ != null)
      {
        _loc3_ = new _loc4_();
        _loc3_.x = 96;
        _loc3_.y = 51;
        _loc2_.push(_loc3_);
      }
      _loc3_ = new splashTopClass() as Bitmap;
      _loc2_.push(_loc3_);
      for each (_loc3_ in _loc2_)
      {
        addChild(_loc3_);
      }
    }
  }
}