#ifdef __cplusplus
extern "C" {
#endif

#include "gd_ext.h"

//Read
gdImagePtr gdImageCreateFromPngFile(const char *filename){ 
	FILE *in = fopen(filename, "rb"); 
	gdImagePtr im = gdImageCreateFromPng(in); 
	fclose(in); 
	return im;	
}
gdImagePtr gdImageCreateFromGifFile(const char *filename){ 
	FILE *in = fopen(filename, "rb"); 
	gdImagePtr im = gdImageCreateFromGif(in); 
	fclose(in); 
	return im;	
}
gdImagePtr gdImageCreateFromJpegFile(const char *filename){ 
	FILE *in = fopen(filename, "rb"); 
	gdImagePtr im = gdImageCreateFromJpeg(in); 
	fclose(in); 
	return im;	
}
gdImagePtr gdImageCreateFromTgaFile(const char *filename){ 
	FILE *in = fopen(filename, "rb"); 
	gdImagePtr im = gdImageCreateFromTga(in); 
	fclose(in); 
	return im;	
}
gdImagePtr gdImageCreateFromBmpFile(const char *filename){ 
	FILE *in = fopen(filename, "rb"); 
	gdImagePtr im = gdImageCreateFromBmp(in); 
	fclose(in); 
	return im;	
}


//Write
int gdImagePngFile(gdImagePtr im,const char *filename, int level){
    FILE *out = fopen(filename, "wb");
    if (!out) return GD_FALSE;
    gdImagePngEx(im, out, level);
    fclose(out);
    return GD_TRUE;
}

int gdImageGifFile(gdImagePtr im,const char *filename){
    FILE *out = fopen(filename, "wb");
    if (!out) return GD_FALSE;
    gdImageGif(im, out);
    fclose(out);
    return GD_TRUE;
}


int gdImageJpegFile(gdImagePtr im,const char *filename, int quality){
    FILE *out = fopen(filename, "wb");
    if (!out) return GD_FALSE;
    gdImageJpeg(im, out, quality);
    fclose(out);
    return GD_TRUE;
}

int gdImageBmpFile(gdImagePtr im,const char *filename, int compression){
    FILE *out = fopen(filename, "wb");
    if (!out) return GD_FALSE;
    gdImageBmp(im, out, compression);
    fclose(out);
    return GD_TRUE;
}





//Point
gdPointFPtr gdPointFCreate(double x, double y){
	gdPointFPtr p;
	p->x=x;
	p->y=y;
	return p;
}

#ifdef __cplusplus
}
#endif