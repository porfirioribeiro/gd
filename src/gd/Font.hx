
package gd;
import gd.Gd.Lib;
@:buildXml("<include name='${haxelib:gd}/extra/font.xml'/>")
@:keep
interface FontFiles{}

//font
@:unreflective
@:include("gd_font.h")
@:native("gdFontPtr")
extern class Font {
	public var nchars:Int;
	public var offset:Int;
	public var w:Int;
	public var h:Int;
	@:native("gdFontGiant")
	public static var Giant:Font;
	@:native("gdFontLarge")
	public static var Large:Font;
	@:native("gdFontMediumBold")
	public static var MediumBold:Font;	
	@:native("gdFontSmall")
	public static var Small:Font;
	@:native("gdFontTiny")
	public static var Tiny:Font;
}