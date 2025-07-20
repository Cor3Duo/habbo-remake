package com.sulake.habbo
{
  public class HabboLocalizationCom // extends SimpleApplication
  {
    [Embed(source="/assets/manifest.bin", mimeType="application/octet-stream")]
    public static var manifest:Class;

    public function HabboLocalizationCom()
    {
      super();
    }
  }
}