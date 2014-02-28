    //
    //  PdfGenerator.h
    //  ExcelTestExample
    //
    //  Created by Zalak on 2/27/14.
    //  Copyright (c) 2014 desk2. All rights reserved.
    //

    #import <Foundation/Foundation.h>
    #define kBorderInset            20.0
    #define kBorderWidth            1.0
    #define kMarginInset            10.0

    //Line drawing
    #define kLineWidth              1.0
    @interface PdfGenerator : NSObject
    {
       int noOfPage;
    }
    - (void) generatePdfWithFilePath: (NSString *)thefilePath withPageSize:(CGSize)pageSize withText:(NSString *)text withImage:(NSString *)imageName withHeader:(NSString*)header;
    - (void) generatePdfWithFilePath: (NSString *)thefilePath withPageSize:(CGSize)pageSize withText:(NSString *)text withHeader:(NSString*)header;
    @end
