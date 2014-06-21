#ifndef INCLUDED_gd_
#define INCLUDED_gd_

#ifdef __cplusplus
extern "C" {
#endif
#include "gd.h"
#include <stdio.h>


// BGD_DECLARE(int) gdImageFile(gdImagePtr im, const char *filename);
// BGD_DECLARE(int) gdSupportsFileType(const char *filename, int writing);
// BGD_DECLARE(gdImagePtr) gdImageCreateFromFile(const char *filename);


//Read
gdImagePtr gdImageCreateFromPngFile(const char *filename);
gdImagePtr gdImageCreateFromGifFile(const char *filename);
gdImagePtr gdImageCreateFromJpegFile(const char *filename);
gdImagePtr gdImageCreateFromTgaFile(const char *filename);
gdImagePtr gdImageCreateFromBmpFile(const char *filename);

// Webp;
// Tiff;
// Gd;
// Gd2;

//Write
int gdImagePngFile(gdImagePtr im,const char *filename, int level);
int gdImageGifFile(gdImagePtr im,const char *filename);
int gdImageJpegFile(gdImagePtr im,const char *filename, int quality);
int gdImageBmpFile(gdImagePtr im,const char *filename, int compression);


gdPointFPtr gdPointFCreate(double x, double y);

#ifdef __cplusplus
}
#endif
#endif