package gd;

/**
 * ...
 * @author Porfirio
 */
@:include("stdio.h")
@:unreflective
@:keep
@:native("FILE *")
extern class File
{

	@:native("fopen")
	public static function open(file:String, mode:String):File;	
	public inline function close():Bool
		return untyped __cpp__("fclose({0})", this);
}