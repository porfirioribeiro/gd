package gd;
#if macro
import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Context;
using haxe.macro.Tools;
using StringTools;
/**
 * ...
 * @author Porfirio
 */
class Macros
{

	public static function buildEnum(name:String,include:String=null):Array<Field>{
		var fields:Array<Field>=Context.getBuildFields();
		var klass:ClassType=Context.getLocalClass().get();
		var type:Type=Context.getLocalType();
		if (!klass.isExtern)
			Context.fatalError("Native Enum class have to be declared extern!",klass.pos);

		klass.meta.add(":native",[macro $v{name}],klass.pos);
		if (include!=null)
			klass.meta.add(":include",[macro $v{include}],klass.pos);


		for (f in fields){
			f.access=[APublic,AStatic];
			f.kind=FVar(type.toComplexType(),null);
			var n=f.name;
			f.meta.push({name:":native",params:[macro $v{n}],pos:klass.pos});
		}

		return fields;
	} 
	public static function buildClass():Array<Field>{
		var fields:Array<Field>=Context.getBuildFields();

		for (f in fields){
			var m=f.meta.filter(function(m) return m.name==":n");
			if (m.length>0){
				var name='gd${f.name}';
				switch (f.kind) {
					case FVar(t,e):

						var native=m[0].params.length>0 ? m[0].params[0] : macro $v{name};
						f.access=[APublic,AStatic];
						f.meta.push({name:":native",params:[native],pos:f.pos});
					case FFun(fn):
						f.access=[APublic,AInline,AStatic];
						var native=m[0].params.length>0 ? m[0].params[0].getValue() : name; //"gdImage"+capitalize(f.name);
						var argsCall="";
						var args="";
						var i=0;
						for (arg in fn.args){
							if (args!="") args+=", ";
							args+='{${i++}}';
							if (argsCall!="") argsCall+=" ,";
							argsCall+=arg.name;
						}
						if (argsCall!="")
							argsCall=", "+argsCall;
						trace('return untyped __cpp__("$native($args)" $argsCall)');
						fn.expr=Context.parse('return untyped __cpp__("$native($args)" $argsCall)',f.pos);
					case _:
				}
			}
		}
		return fields;
	}
	public static function buildImageClass():Array<Field>{
		var fields:Array<Field>=Context.getBuildFields();

		for (f in fields){	
			var m=f.meta.filter(function(m) return m.name==":n");
			if (m.length>0){
				switch (f.kind) {
					case FFun(fn):
						f.access=[APublic,AInline];
						var native=m[0].params.length>0 ? m[0].params[0].getValue() : "gdImage"+capitalize(f.name);
						var argsCall="this";
						var args="{0}";
						var i=1;
						for (arg in fn.args){
							argsCall+=', '+arg.name;
							args+=', {${i++}}';
						}
						fn.expr=Context.parse('return untyped __cpp__("$native($args)",$argsCall)',f.pos);
					case FVar(t,e):
						Context.warning("var not supported yet!",f.pos);
					case FProp(get, set, t, e):
						Context.warning("var not supported yet!",f.pos);
				}
				// var native=m[0].params.length>0 ? m[0].params[0] : macro $v{f.name};
				// f.access=[APublic,AStatic];
				// f.meta.push({name:":native",params:[native],pos:f.pos});
			}			
		}
		return fields;	
	}
	
	public static function capitalize(str:String):String 
		return str.charAt(0).toUpperCase() + str.substr(1);
}
#end