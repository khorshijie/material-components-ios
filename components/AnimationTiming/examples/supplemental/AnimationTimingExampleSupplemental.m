/*
 Copyright 2016-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "AnimationTimingExampleSupplemental.h"

#import "MaterialTypography.h"

const CGFloat kTopMargin = 16.f;
const CGFloat kLeftGutter = 16.f;
const CGFloat kTextOffset = 16.f;

// Size of the circle we animate.
static const CGSize kAnimationCircleSize = {48.f, 48.f};

@implementation AnimationTimingExample (CatalogByConvention)

+ (NSArray *)catalogBreadcrumbs {
  return @[ @"Animation Timing", @"Animation Timing" ];
}

+ (NSString *)catalogDescription {
  return @"Animation timing easing curves create smooth and consistent motion. Easing curves allow"
          " elements to move between positions or states.";
}

+ (BOOL)catalogIsPrimaryDemo {
  return YES;
}

+ (BOOL)catalogIsPresentable {
  return YES;
}


@end

@implementation AnimationTimingExample (Supplemental)

- (void)setupExampleViews {
  self.view.backgroundColor = UIColor.whiteColor;
  self.title = @"Animation Timing";

  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];

  self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame),
                                           CGRectGetHeight(self.view.frame) + kTopMargin);
  self.scrollView.clipsToBounds = YES;
  [self.view addSubview:self.scrollView];

#if defined(__IPHONE_11_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0)
  if (@available(iOS 11.0, *)) {
    // No need to do anything - additionalSafeAreaInsets will inset our content.
    self.scrollView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  } else {
#endif
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:
     @[[NSLayoutConstraint constraintWithItem:self.scrollView
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.topLayoutGuide
                                    attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                     constant:0],
       [NSLayoutConstraint constraintWithItem:self.scrollView
                                    attribute:NSLayoutAttributeBottom
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                    attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                     constant:0],
       [NSLayoutConstraint constraintWithItem:self.scrollView
                                    attribute:NSLayoutAttributeLeft
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                    attribute:NSLayoutAttributeLeft
                                   multiplier:1.0
                                     constant:0],
       [NSLayoutConstraint constraintWithItem:self.scrollView
                                    attribute:NSLayoutAttributeRight
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                    attribute:NSLayoutAttributeRight
                                   multiplier:1.0
                                     constant:0]
       ]];
#if defined(__IPHONE_11_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0)
  }
#endif

  CGFloat lineSpace = (CGRectGetHeight(self.view.frame) - 50.f) / 5.f;
  UILabel *linearLabel = [AnimationTimingExample curveLabelWithTitle:@"Linear"];
  linearLabel.frame =
      CGRectMake(kLeftGutter, kTopMargin, linearLabel.frame.size.width, linearLabel.frame.size.height);
  [self.scrollView addSubview:linearLabel];

  CGRect linearViewFrame =
      CGRectMake(kLeftGutter, kTextOffset + kTopMargin, kAnimationCircleSize.width, kAnimationCircleSize.height);
  self.linearView = [[UIView alloc] initWithFrame:linearViewFrame];
  self.linearView.backgroundColor = [AnimationTimingExample defaultColors][0];
  self.linearView.layer.cornerRadius = kAnimationCircleSize.width / 2.f;
  [self.scrollView addSubview:self.linearView];

  UILabel *materialEaseInOutLabel =
      [AnimationTimingExample curveLabelWithTitle:@"MDCAnimationTimingFunctionStandard"];
  materialEaseInOutLabel.frame =
      CGRectMake(kLeftGutter, lineSpace, materialEaseInOutLabel.frame.size.width,
                 materialEaseInOutLabel.frame.size.height);
  [self.scrollView addSubview:materialEaseInOutLabel];

  CGRect materialEaseInOutViewFrame =
      CGRectMake(kLeftGutter, lineSpace + kTextOffset, kAnimationCircleSize.width,
                 kAnimationCircleSize.height);
  self.materialStandardView = [[UIView alloc] initWithFrame:materialEaseInOutViewFrame];
  self.materialStandardView.backgroundColor = [AnimationTimingExample defaultColors][1];
  self.materialStandardView.layer.cornerRadius = kAnimationCircleSize.width / 2.f;
  [self.scrollView addSubview:self.materialStandardView];

  UILabel *materialEaseOutLabel =
      [AnimationTimingExample curveLabelWithTitle:@"MDCAnimationTimingFunctionDeceleration"];
  materialEaseOutLabel.frame =
      CGRectMake(kLeftGutter, lineSpace * 2.f, materialEaseOutLabel.frame.size.width,
                 materialEaseOutLabel.frame.size.height);
  [self.scrollView addSubview:materialEaseOutLabel];

  CGRect materialDecelerationViewFrame =
      CGRectMake(kLeftGutter, lineSpace * 2.f + kTextOffset, kAnimationCircleSize.width,
                 kAnimationCircleSize.height);
  self.materialDecelerationView = [[UIView alloc] initWithFrame:materialDecelerationViewFrame];
  self.materialDecelerationView.backgroundColor = [AnimationTimingExample defaultColors][2];
  self.materialDecelerationView.layer.cornerRadius = kAnimationCircleSize.width / 2.f;
  [self.scrollView addSubview:self.materialDecelerationView];

  UILabel *materialEaseInLabel =
      [AnimationTimingExample curveLabelWithTitle:@"MDCAnimationTimingFunctionAcceleration"];
  materialEaseInLabel.frame =
      CGRectMake(kLeftGutter, lineSpace * 3.f, materialEaseInLabel.frame.size.width,
                 materialEaseInLabel.frame.size.height);
  [self.scrollView addSubview:materialEaseInLabel];

  CGRect materialAccelerationViewFrame =
      CGRectMake(kLeftGutter, lineSpace * 3.f + kTextOffset, kAnimationCircleSize.width,
                 kAnimationCircleSize.height);
  self.materialAccelerationView = [[UIView alloc] initWithFrame:materialAccelerationViewFrame];
  self.materialAccelerationView.backgroundColor = [AnimationTimingExample defaultColors][3];
  self.materialAccelerationView.layer.cornerRadius = kAnimationCircleSize.width / 2.f;
  [self.scrollView addSubview:self.materialAccelerationView];
   
   UILabel *materialSharpLabel =
       [AnimationTimingExample curveLabelWithTitle:@"MDCAnimationTimingFunctionSharp"];
   materialSharpLabel.frame =
       CGRectMake(kLeftGutter, lineSpace * 4.f, CGRectGetWidth(materialSharpLabel.frame),
                  CGRectGetHeight(materialSharpLabel.frame));
   [self.scrollView addSubview:materialSharpLabel];
   
   CGRect materialSharpViewFrame = CGRectMake(kLeftGutter, lineSpace * 4.f + kTextOffset, kAnimationCircleSize.width, kAnimationCircleSize.height);
   self.materialSharpView = [[UIView alloc] initWithFrame:materialSharpViewFrame];
   self.materialSharpView.backgroundColor = [AnimationTimingExample defaultColors][4];
   self.materialSharpView.layer.cornerRadius = kAnimationCircleSize.width / 2.f;
   [self.scrollView addSubview:self.materialSharpView];
}

+ (UILabel *)curveLabelWithTitle:(NSString *)text {
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
  label.font = [MDCTypography captionFont];
  label.textColor = [UIColor colorWithWhite:0 alpha:[MDCTypography body2FontOpacity]];
  label.text = text;
  [label sizeToFit];
  return label;
}

+ (NSArray<UIColor *> *)defaultColors {
  static NSArray *defaultColors;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    UIColor *primaryColor = [UIColor darkGrayColor];
    defaultColors = @[
      [primaryColor colorWithAlphaComponent:0.95f],
      [primaryColor colorWithAlphaComponent:0.90f],
      [primaryColor colorWithAlphaComponent:0.85f],
      [primaryColor colorWithAlphaComponent:0.80f],
      [primaryColor colorWithAlphaComponent:0.75f]
    ];
  });
  return defaultColors;
}

@end
