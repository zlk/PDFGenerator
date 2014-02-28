PDFGenerator
============
i used http://www.ioslearner.com/generate-pdf-programmatically-iphoneipad/ for creating pdf file, than i made class file using that code, which i would like to share here.
This .h and .m class file can create pdf in ios(xcode). just import class files, and make and object of it, and than call one method, it will create pdf file from given string.
 
 Example is as below.
 in viewcontroller.m
 
     #import "PdfGenerator.h"
     ... 
     - (IBAction)GetPdf:(id)sender
    {
    // for text pdf, with page number as per text data.
      pageSize = CGSizeMake(612, 792);
      NSString *fileName = @"testText.pdf";
      NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
      NSString *documentsDirectory = [paths objectAtIndex:0];
      NSString *pdfFileName = [documentsDirectory stringByAppendingPathComponent:fileName];

   // for text and image but it will creat only 1 page pdf
      NSString *fileName1 = @"testImage.pdf";
      NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
      NSString *documentsDirectory1 = [paths1 objectAtIndex:0];
      NSString *pdfFileName1 = [documentsDirectory1 stringByAppendingPathComponent:fileName1];
    
      PdfGenerator *pdf = [[PdfGenerator alloc]init];
    
      NSString *text = @"Enter Any Text string."
    
      [pdf generatePdfWithFilePath:pdfFileName withPageSize:pageSize withText:text withHeader:@"First Pdf File"];
      [pdf generatePdfWithFilePath:pdfFileName1 withPageSize:pageSize withText:@"Nothing To write, Just Testing With Image." withImage:@"wp9.jpeg" withHeader:@"Image File"];
     }
...
