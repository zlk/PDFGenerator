//
//  PdfGenerator.m
//  ExcelTestExample
//
//  Created by Zalak on 2/27/14.
//  Copyright (c) 2014 desk2. All rights reserved.
//

#import "PdfGenerator.h"

@implementation PdfGenerator
- (void) generatePdfWithFilePath: (NSString *)thefilePath withPageSize:(CGSize)pageSize withText:(NSString *)text withHeader:(NSString*)header
{
    noOfPage = 1;
    UIFont *font = [UIFont systemFontOfSize:14.0];
//    CGSize stringSize = [text sizeWithFont:font
//                         constrainedToSize:CGSizeMake(pageSize.width - 2*kBorderInset-2*kMarginInset, pageSize.height - 2*kBorderInset - 2*kMarginInset)
//                             lineBreakMode:NSLineBreakByWordWrapping];
    CGSize stringSize = [text sizeWithFont:font constrainedToSize:CGSizeMake(pageSize.width - 2*kBorderInset-2*kMarginInset,CGFLOAT_MAX)lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"String Size = %@",NSStringFromCGSize(stringSize));
    int temp = stringSize.height/(pageSize.height - 2*kBorderInset - 2*kMarginInset-50);
    NSLog(@"Temp no = %d",temp);
    noOfPage = temp+1;
    NSLog(@"no of Page Required = %d",noOfPage);
//    NSString *Text = [text substringToIndex:(pageSize.height - 2*kBorderInset - 2*kMarginInset-50)];
//    NSString *Text = text;
//    NSLog(@"Text = %@",Text);
    NSLog(@"text length = %d",[text length]);
    UIGraphicsBeginPDFContextToFile(thefilePath, CGRectZero, nil);
    NSInteger currentPage = 0;
    BOOL done = NO;
    do
    {
        // Mark the beginning of a new page.
//        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageSize.width, pageSize.height), nil);
//        // Draw a page number at the bottom of each page.
//        currentPage++;
//        [self drawPageNumber:currentPage withPageSize:(CGSize)pageSize];
//        //Draw a border for each page.
//        [self drawBorderwithPageSize:pageSize];
//        //Draw text fo our header.
//        [self drawHeaderwithPageSize:(CGSize)pageSize withHeader:header];
//        //Draw a line below the header.
//        [self drawLinewithPageSize:pageSize];
//        //Draw some text for the page.
//        [self drawTextwithPageSize:pageSize withText:Text];
        NSLog(@"no of Page Required = %d",noOfPage);
        int ch = ((pageSize.height - 2*kBorderInset - 2*kMarginInset-70)*[text length])/stringSize.height ;
        NSLog(@"ch = %d",ch);
        NSString *subText;
        subText = text;
        int l ;
        l = [subText length];
        for (int i = 1; i<=noOfPage; i++)
        {
//            NSString *subText = [text substringToIndex:(pageSize.height - 2*kBorderInset - 2*kMarginInset-50)*i];
            if (ch < l)
            {
                NSLog(@"Range = %@",NSStringFromRange(NSMakeRange((ch*(i-1)), ch*i)));
                 subText = [text substringWithRange:NSMakeRange((ch*(i-1)),(ch*i - (ch*(i-1))))];
                 l = l-[subText length];
                 NSLog(@"Next Length = %d",l);
            }
            else
            {
                NSLog(@"Last From Index = %d",ch*(i-1));
                subText = [text substringFromIndex:ch*(i-1)];
            }
            NSLog(@"sub Text = %@",subText);
            
            UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageSize.width, pageSize.height), nil);
            // Draw a page number at the bottom of each page.
            currentPage++;
            [self drawPageNumber:currentPage withPageSize:(CGSize)pageSize];
            //Draw a border for each page.
            [self drawBorderwithPageSize:pageSize];
            //Draw some text for the page.
            [self drawTextwithPageSize:pageSize withText:subText];
            if (i == 1)
            {
                //Draw text fo our header.
                [self drawHeaderwithPageSize:(CGSize)pageSize withHeader:header];
                //Draw a line below the header.
                [self drawLinewithPageSize:pageSize];
                
            }
            
        }
        done = YES;
    }
    while (!done);
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();

//    for (int i = 1; i>=noOfPage; i++)
//    {
//        NSString *subText = [text substringFromIndex:(pageSize.height - 2*kBorderInset - 2*kMarginInset-50)*i];
//        NSLog(@"sub Text = %@",subText);
//    }
   

//    UIGraphicsBeginPDFContextToFile(thefilePath, CGRectZero, nil);
//    
//    NSInteger currentPage = 0;
//    BOOL done = NO;
//    do
//    {
//        // Mark the beginning of a new page.
//        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageSize.width, pageSize.height), nil);
//        
//        // Draw a page number at the bottom of each page.
//        currentPage++;
//        [self drawPageNumber:currentPage withPageSize:(CGSize)pageSize];
//        //Draw a border for each page.
//        [self drawBorderwithPageSize:pageSize];
//        //Draw text fo our header.
//        [self drawHeaderwithPageSize:(CGSize)pageSize withHeader:header];
//        //Draw a line below the header.
//        [self drawLinewithPageSize:pageSize];
//        //Draw some text for the page.
//        [self drawTextwithPageSize:pageSize withText:text];
//        //Draw an image
//        done = YES;
//    }
//    while (!done);
//    
//    // Close the PDF context and write the contents out.
//    UIGraphicsEndPDFContext();
}
- (void) generatePdfWithFilePath: (NSString *)thefilePath withPageSize:(CGSize)pageSize withText:(NSString *)text withImage:(NSString *)imageName withHeader:(NSString*)header
{
    UIGraphicsBeginPDFContextToFile(thefilePath, CGRectZero, nil);
    
    NSInteger currentPage = 0;
    BOOL done = NO;
    do
    {
       // Mark the beginning of a new page.
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageSize.width, pageSize.height), nil);
        // Draw a page number at the bottom of each page.
        currentPage++;
        [self drawPageNumber:currentPage withPageSize:(CGSize)pageSize];
        //Draw a border for each page.
        [self drawBorderwithPageSize:pageSize];
        //Draw text fo our header.
        [self drawHeaderwithPageSize:(CGSize)pageSize withHeader:header];
        //Draw a line below the header.
        [self drawLinewithPageSize:pageSize];
        //Draw some text for the page.
        [self drawTextwithPageSize:pageSize withText:text];
        //Draw an image
        [self drawImagewithPageSize:(CGSize)pageSize withImageName:imageName];
        done = YES;
    }
    while (!done);
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
}

- (void) drawBorderwithPageSize:(CGSize)pageSize
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    UIColor *borderColor = [UIColor brownColor];
    CGRect rectFrame = CGRectMake(kBorderInset, kBorderInset, pageSize.width-kBorderInset*2, pageSize.height-kBorderInset*2);
    CGContextSetStrokeColorWithColor(currentContext, borderColor.CGColor);
    CGContextSetLineWidth(currentContext, kBorderWidth);
    CGContextStrokeRect(currentContext, rectFrame);
}
- (void) drawLinewithPageSize:(CGSize)pageSize
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(currentContext, kLineWidth);
    
    CGContextSetStrokeColorWithColor(currentContext, [UIColor blueColor].CGColor);
    
    CGPoint startPoint = CGPointMake(kMarginInset + kBorderInset, kMarginInset + kBorderInset + 40.0);
    CGPoint endPoint = CGPointMake(pageSize.width - 2*kMarginInset -2*kBorderInset, kMarginInset + kBorderInset + 40.0);
    
    CGContextBeginPath(currentContext);
    CGContextMoveToPoint(currentContext, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(currentContext, endPoint.x, endPoint.y);
    
    CGContextClosePath(currentContext);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
}
- (void) drawTextwithPageSize:(CGSize)pageSize withText:(NSString *)text
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 1.0);
    
    UIFont *font = [UIFont systemFontOfSize:14.0];
    CGSize stringSize = [text sizeWithFont:font
                               constrainedToSize:CGSizeMake(pageSize.width - 2*kBorderInset-2*kMarginInset, pageSize.height - 2*kBorderInset - 2*kMarginInset-50)
                                   lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"String Size = %@",NSStringFromCGSize(stringSize));
    CGRect renderingRect = CGRectMake(kBorderInset + kMarginInset, kBorderInset + kMarginInset + 50.0, pageSize.width - 2*kBorderInset - 2*kMarginInset, stringSize.height+50);
    NSLog(@"String Rect Size = %@",NSStringFromCGRect(renderingRect));
    [text drawInRect:renderingRect
                  withFont:font
             lineBreakMode:NSLineBreakByWordWrapping
                 alignment:NSTextAlignmentLeft];
}
- (void) drawImagewithPageSize:(CGSize)pageSize withImageName:(NSString *)imageName
{
    UIImage * demoImage = [UIImage imageNamed:imageName];
    [demoImage drawInRect:CGRectMake( (pageSize.width - demoImage.size.width/2)/2, 350, demoImage.size.width/2, demoImage.size.height/2)];
}
- (void)drawPageNumber:(NSInteger)pageNumber withPageSize:(CGSize)pageSize
{
    NSString* pageNumberString = [NSString stringWithFormat:@"Page %d", pageNumber];
    UIFont* theFont = [UIFont systemFontOfSize:12];
    
    CGSize pageNumberStringSize = [pageNumberString sizeWithFont:theFont
                                               constrainedToSize:pageSize
                                                   lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect stringRenderingRect = CGRectMake(kBorderInset,
                                            pageSize.height - 40.0,
                                            pageSize.width - 2*kBorderInset,
                                            pageNumberStringSize.height);
    
    [pageNumberString drawInRect:stringRenderingRect withFont:theFont lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
}
- (void) drawHeaderwithPageSize:(CGSize)pageSize withHeader:(NSString*)header
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(currentContext, 0.3, 0.7, 0.2, 1.0);
    
//    NSString *textToDraw = @"Pdf Demo - iOSLearner.com";
    
    UIFont *font = [UIFont systemFontOfSize:24.0];
    
    CGSize stringSize = [header sizeWithFont:font constrainedToSize:CGSizeMake(pageSize.width - 2*kBorderInset-2*kMarginInset, pageSize.height - 2*kBorderInset - 2*kMarginInset) lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect renderingRect = CGRectMake(kBorderInset + kMarginInset, kBorderInset + kMarginInset, pageSize.width - 2*kBorderInset - 2*kMarginInset, stringSize.height);
    
    [header drawInRect:renderingRect withFont:font lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentLeft];
}

@end
