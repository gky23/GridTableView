/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIImageView+WebCache.h"

@implementation UIImageView (WebCache)

- (void)setImageWithURL:(NSURL *)url
{
    [self setImageWithURL:url needScaling:NO];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self setImageWithURL:url placeholderImage:placeholder needScaling:NO];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options
{
    [self setImageWithURL:url placeholderImage:placeholder needScaling:NO options:0];
}

#if NS_BLOCKS_AVAILABLE
- (void)setImageWithURL:(NSURL *)url success:(void (^)(UIImage *image))success failure:(void (^)(NSError *error))failure;
{
    [self setImageWithURL:url needScaling:NO success:success failure:failure];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder success:(void (^)(UIImage *image))success failure:(void (^)(NSError *error))failure;
{
    [self setImageWithURL:url placeholderImage:placeholder needScaling:NO success:success failure:failure];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options success:(void (^)(UIImage *image))success failure:(void (^)(NSError *error))failure;
{
    [self setImageWithURL:url placeholderImage:placeholder needScaling:NO options:0 success:success failure:failure];
}
#endif

//为SDWebImage提供选择是否缩放的功能方法（上面的默认方法是不支持按比例缩放图片的（会直接撑开到定义的frame大小））
- (void)setImageWithURL:(NSURL *)url needScaling:(BOOL)scaling
{
    [self setImageWithURL:url placeholderImage:nil needScaling:scaling];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder needScaling:(BOOL)scaling
{
    [self setImageWithURL:url placeholderImage:placeholder needScaling:scaling options:0];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder needScaling:(BOOL)scaling options:(SDWebImageOptions)options
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];
    
    self.image = placeholder;
    
    if (url)
    {
        NSDictionary *info = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:scaling] forKey:@"scaling"];
        [manager downloadWithURL:url delegate:self options:options userInfo:info];
    }
}

#if NS_BLOCKS_AVAILABLE
- (void)setImageWithURL:(NSURL *)url needScaling:(BOOL)scaling success:(void (^)(UIImage *image))success failure:(void (^)(NSError *error))failure;
{
    [self setImageWithURL:url placeholderImage:nil needScaling:scaling success:success failure:failure];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder needScaling:(BOOL)scaling success:(void (^)(UIImage *image))success failure:(void (^)(NSError *error))failure;
{
    [self setImageWithURL:url placeholderImage:placeholder needScaling:scaling options:0 success:success failure:failure];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder needScaling:(BOOL)scaling options:(SDWebImageOptions)options success:(void (^)(UIImage *image))success failure:(void (^)(NSError *error))failure;
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];
    
    self.image = placeholder;
    
    if (url)
    {
        NSDictionary *info = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:scaling] forKey:@"scaling"];
        [manager downloadWithURL:url delegate:self options:options userInfo:info success:success failure:failure];
    }
}
#endif

- (void)cancelCurrentImageLoad
{
    [[SDWebImageManager sharedManager] cancelForDelegate:self];
}

- (void)webImageManager:(SDWebImageManager *)imageManager didProgressWithPartialImage:(UIImage *)image forURL:(NSURL *)url userInfo:(NSDictionary *)info
{
    self.image = image;
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image forURL:(NSURL *)url userInfo:(NSDictionary *)info
{    
    if ([[info valueForKey:@"scaling"] boolValue])
    {
        //将图片按比例缩放到原定frame的大小内，并将原UIImageView的frame改成图片的大小（否则图片还是会撑开到原先的ImageView的整个frame）
        UIImage *resizeImage = [image scaleProportionalToSize:self.frame.size];
        CGRect oldFrame = self.frame;
        //缩放后的图片要居中显示
        CGFloat newOriginX = oldFrame.origin.x + (oldFrame.size.width - resizeImage.size.width)/2;
        CGFloat newOriginY = oldFrame.origin.y + (oldFrame.size.height - resizeImage.size.height)/2;
        //按图片缩放后大小调整frame
        self.frame = CGRectMake(newOriginX, newOriginY, resizeImage.size.width, resizeImage.size.height);
        
        self.image = resizeImage;
    } else {
        self.image = image;
    }
}

@end
