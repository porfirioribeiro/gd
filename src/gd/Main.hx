package gd;
import gd.Gd;

/**
 * ...
 * @author Porfirio
 */
@:noStack
class Main 
{
	
	static function main() 
	{
		// var i = Image.create(10, 10);
		// var i = Image.fromPng("demoin.png");
		var i = Image.createTrueColor(100,100);
		// //trace(untyped __global__.gdSupportsFileType("gdtest.png",false));
		// //var i:Image = untyped __global__.gdImageCreateFromFile("gdtest.png");
		
		// //i=untyped __cpp__("gdImageCreateFromPngFile(\"demoin.png\")");
		if (i.ok) {
			// cpp.Lib.println(i.width);
			// cpp.Lib.println(i.height);
			// trace(i.save("a.gd2"));
			// trace(i.savePng("out.png"));
			// var x=10;
			// var y=10;
			// var color=0;
			// untyped __cpp__("gdImageSetPixel({0}, {1}, {2}, {3})", i, x, y, color);
			// untyped __global__.gdImageSetPixel(i, x, y, color);

			// i.setResolution(200,2);
			// i.setPixel(10,10,Gd.TrueColor(0,255,0));
			// i.setClip(20,20,80,100);
			// i.line(0,0,50,50,Gd.TrueColor(255,0,0));
			// i.rectangle(50,50,100,100,Gd.TrueColor(0,0,255));
			// i.filledRectangle(10,10,90,90,Gd.TrueColorAlpha(255,0,255,90));

			var f="Sans";
			var s="Hello";
			var r=untyped __cpp__(" gdImageStringFT({0},0,gdImageColorResolve(i, 255, 0, 255),{1},40,10,10,0,{2})",i,f,s);
			// trace(r);
			// trace(i.getTrueColorPixel(10,10));

			trace(gd.Font.Giant.w);
			trace(gd.Font.Large.w);
			trace(gd.Font.MediumBold.w);
			trace(gd.Font.Small.w);
			trace(gd.Font.Tiny.w);
			i.string(gd.Font.MediumBold,10,10,"Hello World!",Gd.TrueColor(255,0,0));
			i.savePng("out.png");
			var ni:Image=i.scale(20, 20);



			ni.savePng("scale.png");
			ni.destroy();
			i.destroy();
		}


	}
	
}