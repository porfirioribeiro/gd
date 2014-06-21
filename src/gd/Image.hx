package gd;

import gd.Gd;

/**
 * ...
 * @author Porfirio
 */
@:include("gd_ext.h")
@:unreflective
@:keep
@:native("gdImagePtr")
@:build(gd.Macros.buildImageClass())
extern class Image
{
	@:native("gdImageCreate")
	public static function create(w:Int, h:Int):Image;		
	
	@:native("gdImageCreateTrueColor")
	public static function createTrueColor(w:Int, h:Int):Image;
	
	@:native("gdImageCreateFromFile")
	public static function fromFile(file:String):Image;	
	
	@:native("gdImageCreateFromPngFile")
	public static function fromPng(file:String):Image;	

	@:native("gdImageCreateFromGifFile")
	public static function fromGif(file:String):Image;

	@:native("gdImageCreateFromWBMPFile")
	public static function fromWBMP(file:String):Image;

	@:native("gdImageCreateFromJpegFile")
	public static function fromJpeg(file:String):Image;	

	@:native("gdImageCreateFromTgaFile")
	public static function fromTga(file:String):Image;	

	@:native("gdImageCreateFromBmpFile")
	public static function fromBmp(file:String):Image;		

	
	

		
	public var ok(get, null):Bool;
	public inline function get_ok():Bool
		return untyped __cpp__("{0}!=NULL", this);
		
	public var width(get, null):Int;
	inline function get_width():Int	return untyped __cpp__("({0})->sx", this);	
	
	public var height(get, null):Int;
	inline function get_height():Int	return untyped __cpp__("({0})->sy", this);
	
	
	public inline function save(file:String):Bool
		return untyped __cpp__("gdImageFile({0},{1})", this, file);

	@:n("gdImagePngFile") public function savePngEx(file:String, level:Int):Bool;

	// public inline function savePngEx(file:String, level:Int):Bool
	// 	return untyped __cpp__("gdImagePngFile({0},{1},{2})", this, file, level);

	public inline function savePng(file:String):Bool
		return savePngEx(file,-1);

	/**
	  * `destroy` is used to free the memory associated with an image. 
	  * It is important to invoke gdImageDestroy before exiting your program or 
	  * assigning a new image to a gdImagePtr variable. 
	  */
	@:n public function destroy():Void;
	
	@:n public function setPixel(x:Int, y:Int, color:Int):Void;
	@:n public function getPixel(x:Int, y:Int):Int;
	@:n public function getTrueColorPixel(x:Int, y:Int):Int;

	@:n public function AABlend():Void;

	@:n public function line(x1:Int, y1:Int, x2:Int, y2:Int, color:Int):Void;

	/* For backwards compatibility only. Use gdImageSetStyle()
	   for much more flexible line drawing. */
	@:n public function dashedLine(x1:Int, y1:Int, x2:Int, y2:Int, color:Int):Void;
	/* Corners specified (not width and height). Upper left first, lower right
	   second. */
	@:n public function rectangle(x1:Int, y1:Int, x2:Int, y2:Int, color:Int):Void;
	/* Solid bar. Upper left corner first, lower right corner second. */
	@:n public function filledRectangle(x1:Int, y1:Int, x2:Int, y2:Int, color:Int):Void;
	@:n public function setClip(x1:Int, y1:Int, x2:Int, y2:Int):Void;
	// @:n public function imageGetClip(int *x1P, int *y1P, int *x2P, int *y2P):Void;
	@:n public function setResolution(res_x:Int, res_y:Int):Void;
	@:n public function boundsSafe (x:Int, y:Int):Int;

	@:n public function string (font:Font, x:Int, y:Int, s:String, color:Int):Int;
	// public inline function string (font:Font, x:Int, y:Int, s:String, color:Int):Int{
	// 	return untyped __cpp__("gdImageString({0},{1},{2},{3},{4},{5})",this,font,x,y,s,color);
	// 	// return untyped __cpp__("gdImageString({0},{1},{2},{3},(unsigned char*){4}.c_str(),{5})",this,font,x,y,s,color);
	// }


// gdImageString (gdImagePtr im, gdFontPtr f, int x, int y,
//                                  unsigned char *s, int color);
// BGD_DECLARE(void) gdImageStringUp (gdImagePtr im, gdFontPtr f, int x, int y,
//                                    unsigned char *s, int color);


	
	@:n public function scale(width:Int, height:Int):Image;
}