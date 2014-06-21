package gd;

// import gd.Gd.Lib;
/**
 * ...
 * @author Porfirio
 */
@:buildXml("<include name='${haxelib:gd}/extra/gd.xml'/>")
@:keep
@:remove
interface Lib{}

@:include("gd_ext.h")
@:build(gd.Macros.buildClass())
extern class Gd {

	@:n var MaxColors:Int;

	@:n var AlphaMax:Int;
	@:n var AlphaOpaque:Int;
	@:n var AlphaTransparent:Int;
	@:n var RedMax:Int;
	@:n var GreenMax:Int;
	@:n var BlueMax:Int;
	@:n var TrueColorGetAlpha:Int;
	@:n var TrueColorGetRed:Int;
	@:n var TrueColorGetGreen:Int;
	@:n var TrueColorGetBlue:Int;
	@:n var EffectReplace:Int;
	@:n var EffectAlphaBlend:Int;
	@:n var EffectNormal:Int;
	@:n var EffectOverlay:Int;

	@:n function AlphaBlend(src:Int,dst:Int):Int;

	@:n var DashSize:Int;
	@:n var Styled:Int; 
	@:n var Brushed:Int; 
	@:n var StyledBrushed:Int; 
	@:n var Tiled:Int; 
	@:n var Transparent:Int; 
	@:n var AntiAliased:Int; 

	@:n function TrueColor(r:Int, g:Int, b:Int):Int; 
	@:n function TrueColorAlpha(r:Int, g:Int, b:Int, a:Int):Int; 

	@:n("GD_MAJOR_VERSION") var MajorVersion:Int;
	@:n("GD_MINOR_VERSION") var MinorVersion:Int;
	@:n("GD_RELEASE_VERSION") var ReleaseVersion:Int;
	@:n("HX_CSTRING(GD_EXTRA_VERSION)") var ExtraVersion:String;
	@:n("HX_CSTRING(GD_VERSION_STRING)") var VersionString:String;

}

#if !macro

@:build(gd.Macros.buildEnum("gdPaletteQuantizationMethod","gd_ext.h"))
extern class PaletteQuantizationMethod {
	var GD_QUANT_DEFAULT;
	var GD_QUANT_JQUANT;  
	var GD_QUANT_NEUQUANT; 
	var GD_QUANT_LIQ; 
}

@:build(gd.Macros.buildEnum("gdInterpolationMethod","gd_ext.h"))
extern class InterpolationMethod {
	var GD_DEFAULT;
	var GD_BELL;
	var GD_BESSEL;
	var GD_BILINEAR_FIXED;
	var GD_BICUBIC;
	var GD_BICUBIC_FIXED;
	var GD_BLACKMAN;
	var GD_BOX;
	var GD_BSPLINE;
	var GD_CATMULLROM;
	var GD_GAUSSIAN;
	var GD_GENERALIZED_CUBIC;
	var GD_HERMITE;
	var GD_HAMMING;
	var GD_HANNING;
	var GD_MITCHELL;
	var GD_NEAREST_NEIGHBOUR;
	var GD_POWER;
	var GD_QUADRATIC;
	var GD_SINC;
	var GD_TRIANGLE;
	var GD_WEIGHTED4;
	var GD_METHOD_COUNT;
}
#end

@:include("gd_ext.h")
@:unreflective
@:native("gdPointFPtr")
extern class PointFPtr {
	public var x:Float;
	public var y:Float;
	@:native("gdPointFCreate")
	public static function create(x:Float, y:Float):PointFPtr;
	
}

@:forward
abstract PointF(PointFPtr) from PointFPtr to PointFPtr {
	@:from public static inline function fromTFloat(p: { x:Float, y:Float } ):PointF 
		return PointFPtr.create(p.x, p.y);	
	@:from public static inline function fromTFInt(p: { x:Int, y:Int } ):PointF 
		return PointFPtr.create(p.x, p.y);
}
