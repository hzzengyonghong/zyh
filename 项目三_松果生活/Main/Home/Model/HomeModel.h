//
//  HomeModel.h
//  项目三_松果生活
//
//  Created by mac on 16/8/20.
//  Copyright © 2016年 CW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
@property(nonatomic,assign)int tpye;
@property(nonatomic,strong)NSString *shareUrl;
@property(nonatomic,strong)NSString *idstr;
@property(nonatomic,strong)NSString *bgurl;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *et;
@property(nonatomic,strong)NSString *st;
@property(nonatomic,strong)NSString *ulr;
@property(nonatomic,strong)NSArray *resource;
@property(nonatomic,strong)NSDictionary *user;
@property(nonatomic,strong)NSString *ct;
//tpye=0
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSString *status;



/*
 {
 activities = "<null>";
 address = "@\U5317\U4eac\U671d\U9633 \U8c37\U7269\U70d8\U7119\U5b66\U9662";
 attended = 0;
 autoPublish = 0;
 category =     {
 id = 5662db5009d070365fa3e542;
 name = "\U98ce\U5c1a";
 };
 commentCount = 0;
 comments = "<null>";
 cover =     {
 h = 808;
 height = 825;
 id = 57b6b1de7cf71176bcb51d49;
 isSubTitle = 0;
 tp = 0;
 txt = "";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b6b1de7cf71176bcb51d49";
 w = 1077;
 width = 1198;
 x = 105;
 y = 0;
 };
 ct = 1471762920000;
 dt = 1471996800000;
 et = 1472014800000;
 favorite = 0;
 geo =     {
 address = "\U4e09\U5143\U6865\U51e4\U51f0\U6c47\U8d2d\U7269\U4e2d\U5fc3\U4e8c\U697cL201(Costacoffee\U65c1)";
 city =         {
 latitude = "39.905141";
 longitude = "116.401155";
 name = "\U5317\U4eac\U5e02";
 };
 coordinates =         {
 latitude = "39.96291";
 longitude = "116.457046";
 };
 name = "\U5317\U4eac\U5e02\U8c37\U7269\U70d8\U7119\U5b66\U9662";
 };
 id = 57b6b2ea7cf71176bcb51d82;
 maxAttendees = 10;
 name = "\U62db\U52df | \U86cb\U7cd5\U88f1\U82b1\U8bfe\U7a0b\Uff0c\U4e09\U5c0f\U65f6\U5b66\U4f1a\U97e9\U5f0f\U88f1\U82b1";
 needPush = 0;
 numAttendees = 5;
 price = 299;
 privacyUrl = "http://www.songguolife.com/nuts/privacy.html";
 pt = 1471590120000;
 reminder = 0;
 resource =     (
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d17;
 isSubTitle = 0;
 tp = 2;
 txt = "";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d17";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 1824;
 id = 57b6afa47cf71176bcb51d3b;
 isSubTitle = 0;
 tp = 0;
 txt = "";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b6afa47cf71176bcb51d3b";
 w = 0;
 width = 4312;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d18;
 isSubTitle = 0;
 tp = 2;
 txt = "\U97e9\U5f0f\U88f1\U82b1\Uff0c\U662f\U5728wilton\U88f1\U82b1\U65b9\U6cd5\U57fa\U7840\U4e0a\Uff0c\U884d\U751f\U548c\U53d1\U5c55\U8d77\U6765\U7684\U4e00\U79cd\U88f1\U82b1\U65b9\U6cd5\Uff0c\U8d77\U6e90\U4e8e\U97e9\U56fd\Uff0c\U6545\U79f0\U4e4b\U97e9\U5f0f\U88f1\U82b1\U3002";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d18";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d19;
 isSubTitle = 0;
 tp = 2;
 txt = "\U4e0d\U540c\U4e8e\U4ee5\U5f80\U7684\U86cb\U7cd5\U88f1\U82b1\Uff0c\U97e9\U5f0f\U88f1\U82b1\U66f4\U4e3a\U6e05\U65b0\U81ea\U7136\Uff0c\U8272\U5f69\U642d\U914d\U66f4\U4e3a\U534f\U8c03\U5e73\U8861\Uff0c\U6e05\U4e3d\U8131\U4fd7\Uff0c\U82b1\U5349\U7cbe\U7f8e\U903c\U771f\Uff0c\U6bcf\U4e00\U7247\U82b1\U74e3\U6bcf\U4e00\U7247\U53f6\U5b50\U90fd\U9700\U8981\U5236\U4f5c\U8005\U8010\U5fc3\U7684\U7684\U4e00\U6b65\U4e00\U6b65\U5236\U4f5c\U51fa\U6765\Uff0c\U6829\U6829\U5982\U751f\U7684\U5a07\U5ae9\U82b1\U6735\U5927\U6982\U662f\U6bcf\U4e2a\U5973\U5b69\U513f\U90fd\U65e0\U6cd5\U62d2\U7edd\U7684\U6d6a\U6f2b\U3002";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d19";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 700;
 id = 57b6b0457cf71176bcb51d3f;
 isSubTitle = 0;
 tp = 0;
 txt = "";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b6b0457cf71176bcb51d3f";
 w = 0;
 width = 700;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d1a;
 isSubTitle = 0;
 tp = 2;
 txt = "\U00a0";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d1a";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d1b;
 isSubTitle = 0;
 tp = 2;
 txt = "\U6d3b\U52a8\U5185\U5bb9";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d1b";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d1c;
 isSubTitle = 0;
 tp = 2;
 txt = "\U97e9\U5f0f\U88f1\U82b1\U7684\U91cd\U70b9\U90fd\U80fd\U5728\U8bfe\U4e0a\U5b66\U5230\Uff1a";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d1c";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d1d;
 isSubTitle = 0;
 tp = 2;
 txt = "\U5305\U62ec\U914d\U8272\U8c03\U8272\U6280\U5de7\Uff0c\U5b66\U4f1a\U4e86\U53ef\U4ee5\U81ea\U884c\U8c03\U51fa\U8fd1\U767e\U79cd\U88f1\U82b1\U989c\U8272\Uff1b";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d1d";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d1e;
 isSubTitle = 0;
 tp = 2;
 txt = "\U5305\U62ec\U5976\U6cb9\U971c\U7684\U5236\U4f5c\U65b9\U6cd5\U548c\U6280\U5de7\Uff0c\U590f\U5929\U4e5f\U80fd\U4fdd\U6301\U88f1\U82b1\U5f62\U72b6\U6301\U4e45\Uff1b";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d1e";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d1f;
 isSubTitle = 0;
 tp = 2;
 txt = "\U8fd8\U5305\U62ec\U5976\U6cb9\U971c\U7684\U62b9\U9762\U79d8\U7b08\Uff1b";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d1f";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d20;
 isSubTitle = 0;
 tp = 2;
 txt = "\U4ee5\U53ca\U82b1\U6735\U4f4d\U7f6e\U7684\U5b89\U6392\U8bb2\U89e3\U3002";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d20";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 3448;
 id = 57b6b05b7cf71176bcb51d40;
 isSubTitle = 0;
 tp = 0;
 txt = "";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b6b05b7cf71176bcb51d40";
 w = 0;
 width = 5168;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d21;
 isSubTitle = 0;
 tp = 2;
 txt = "\U9009\U62e9\U97e9\U5f0f\U88f1\U82b1\U86cb\U7cd5\Uff0c\U4e0d\U4ec5\U9009\U62e9\U4e86\U86cb\U7cd5\U672c\U8eab\Uff0c\U8fd8\U9009\U62e9\U4e86\U5236\U4f5c\U5b83\U7684\U88f1\U82b1\U5320\Uff0c\U6bcf\U4e00\U4e2a\U88f1\U82b1\U6280\U5e08\U90fd\U6709\U4e0d\U540c\U7684\U5ba1\U7f8e\U89d2\U5ea6\U3001\U827a\U672f\U9020\U8be3\Uff0c\U5236\U4f5c\U51fa\U6765\U7684\U88f1\U82b1\U98ce\U683c\U4e5f\U4e0d\U5c3d\U76f8\U540c\Uff1b\U6240\U4ee5\Uff0c\U5b66\U4e60\U97e9\U5f0f\U88f1\U82b1\Uff0c\U8981\U7ec3\U7684\U4e0d\U4ec5\U662f\U624b\U5de5\U6280\U5de7\Uff0c\U66f4\U91cd\U8981\U7684\U662f\U5bf9\U82b1\U6735\U3001\U8272\U5f69\U3001\U5f62\U72b6\U5ba1\U7f8e\U7684\U57f9\U517b\U54e6\U3002";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d21";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 3163;
 id = 57b6b21e7cf71176bcb51d4b;
 isSubTitle = 0;
 tp = 0;
 txt = "";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b6b21e7cf71176bcb51d4b";
 w = 0;
 width = 5168;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d22;
 isSubTitle = 0;
 tp = 2;
 txt = "\U00a0";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d22";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d23;
 isSubTitle = 0;
 tp = 2;
 txt = "\U5173\U4e8e\U8c37\U7269\U70d8\U7119\U5b66\U9662";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d23";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d24;
 isSubTitle = 0;
 tp = 2;
 txt = "\U8c37\U7269\U70d8\U7119\U5b66\U9662\U662f\U753150\U4e07\U7c89\U4e1d\U4fe1\U8d56\U7684\U5bb6\U5ead\U70d8\U7119\U4e00\U7ad9\U5f0f\U5e73\U53f0\Uff0c\U7531\U77e5\U540d\U5fae\U4fe1\U81ea\U5a92\U4f53\U2014\U2014 i\U70d8\U7119 \U53ca\U5317\U4eac\U6700\U4f73\U751c\U54c1\U5c4b\U738b\U592a\U5bb6\U521b\U59cb\U4eba\U5171\U540c\U521b\U529e\Uff0c\U65e8\U5728\U6253\U9020\U4e00\U5bb6\U96c6\U4e13\U4e1a\U70d8\U7119\U5b66\U9662\U548c\U5e97\U94fa\U8425\U8fd0\U8d44\U6e90\U5171\U4eab\U7684\U5e73\U53f0\U3002";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d24";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d25;
 isSubTitle = 0;
 tp = 2;
 txt = "-- \U8c37\U7269\U70d8\U7119\U5b66\U9662\U96c6\U7ed3\U4e86\U4e2d\U56fd\U5962\U534e\U4e94\U661f\U7ea7\U9152\U5e97\U997c\U623f\U53a8\U5e08\U957f\U3001\U77e5\U540d\U751c\U54c1\U5e97\U8fd0\U8425\U8fbe\U4eba\U3001\U6709\U6d77\U5916\U53d7\U8bad\U7ecf\U9a8c\U7684\U8bfe\U7a0b\U7814\U53d1\U56e2\U961f\Uff0c\U4ee5\U53ca\U6570\U767e\U5bb6\U4f18\U8d28\U70d8\U7119\U4f9b\U5e94\U5546\U7b49\U8d44\U6e90\Uff1b";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d25";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d26;
 isSubTitle = 0;
 tp = 2;
 txt = "-- \U6211\U4eec\U4e3a\U6000\U62b1\U5f00\U751c\U54c1\U5e97\U68a6\U60f3\U7684\U521b\U4e1a\U4eba\U7fa4\U63d0\U4f9b\U4e13\U4e1a\U6280\U672f\U57f9\U8bad\U3001\U5546\U4e1a\U8fd0\U8425\U6307\U5bfc\U53ca\U539f\U6599\U6e20\U9053\U652f\U6301\U3002";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d26";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d27;
 isSubTitle = 0;
 tp = 2;
 txt = "-- \U6211\U4eec\U8fd8\U4e3a\U5bb6\U5ead\U70d8\U7119\U7231\U597d\U8005\U63d0\U4f9b\U57fa\U7840\U5230\U8fdb\U9636\U7684\U5468\U672b\U901f\U6210\U8bfe\U7a0b\Uff0c\U5373\U4fbf\U662f\U96f6\U57fa\U7840\U4e5f\U80fd\U4e0e\U5927\U5e08\U9762\U5bf9\U9762\U5b66\U4e60\U70d8\U7119\U77e5\U8bc6\U6280\U5de7\U3002";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d27";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d28;
 isSubTitle = 0;
 tp = 2;
 txt = "-- \U6211\U4eec\U540c\U65f6\U4e5f\U4e3a\U516c\U53f8\U56e2\U961f\U5efa\U8bbe\U63d0\U4f9b\U91cf\U8eab\U5b9a\U5236\U7684\U6b22\U4e50\U4f53\U9a8c\U8bfe\U7a0b\Uff0c\U5728\U6109\U5feb\U7684\U6c1b\U56f4\U548c\U56e2\U961f\U534f\U4f5c\U4e0b\U5b66\U4e60\U9886\U5148\U7684\U70d8\U7119\U6280\U5de7\U3002";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d28";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d29;
 isSubTitle = 0;
 tp = 2;
 txt = "\U00a0";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d29";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d2a;
 isSubTitle = 0;
 tp = 2;
 txt = "\U62a5\U540d\U65b9\U5f0f";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d2a";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d2b;
 isSubTitle = 0;
 tp = 2;
 txt = "1\U70b9\U51fb[\U6211\U8981\U53c2\U52a0\U6d3b\U52a8]\U65b9\U53ef\U62a5\U540d\Uff1b";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d2b";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d2c;
 isSubTitle = 0;
 tp = 2;
 txt = "2\U586b\U5199\U5177\U4f53\U4fe1\U606f\Uff0c\U83b7\U5f97\U7535\U5b50\U9080\U8bf7\U5361\Uff0c\U5373\U4e3a\U62a5\U540d\U6210\U529f\Uff1b";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d2c";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d2d;
 isSubTitle = 0;
 tp = 2;
 txt = "3\U73b0\U573a\U51fa\U793a\U7535\U5b50\U9080\U8bf7\U5361\Uff0c\U5373\U53ef\U5165\U573a\U3002\Uff08\U70b9\U51fb\U201c\U6211\U201d\U2014\U2014\U70b9\U51fb\U201c\U6d3b\U52a8\U201d\Uff0c\U53ef\U67e5\U770b\U7535\U5b50\U9080\U8bf7\U5361\Uff09";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d2d";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d2e;
 isSubTitle = 0;
 tp = 2;
 txt = "\U00a0";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d2e";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d2f;
 isSubTitle = 0;
 tp = 2;
 txt = "\U6e29\U99a8\U63d0\U793a";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d2f";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d30;
 isSubTitle = 0;
 tp = 2;
 txt = "\U672c\U6d3b\U52a8\U62a5\U540d\U540e\U4e0d\U53ef\U9000\U6b3e\Uff1b";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d30";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 0;
 id = 57b8f3f67cf71176bcb52d31;
 isSubTitle = 0;
 tp = 2;
 txt = "\U5982\U6709\U7591\U95ee\Uff0c\U8bf7\U6dfb\U52a0\U5fae\U4fe1\U54a8\U8be2\Uff1a";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b8f3f67cf71176bcb52d31";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 },
 {
 h = 0;
 height = 430;
 id = 57b6b02c7cf71176bcb51d3e;
 isSubTitle = 0;
 tp = 0;
 txt = "";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b6b02c7cf71176bcb51d3e";
 w = 0;
 width = 430;
 x = 0;
 y = 0;
 }
 );
 sensitive = "<null>";
 shareUrl = "http://www.songguolife.com/nuts/#/activity/57b6b2ea7cf71176bcb51d82";
 st = 1472004000000;
 status = 1;
 text = "";
 topImage =     {
 h = 0;
 height = 825;
 id = 57b6b1cd7cf71176bcb51d48;
 isSubTitle = 0;
 tp = 0;
 txt = "";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/57b6b1cd7cf71176bcb51d48";
 w = 0;
 width = 1198;
 x = 0;
 y = 0;
 };
 user =     {
 action =         (
 2,
 7
 );
 authorApplied = 0;
 canPreview = 0;
 ct = 1467688881103;
 desc = "";
 favCount = 0;
 gzh = "";
 icon = "http://7xnqn3.com2.z0.glb.qiniucdn.com/577b27b07cf7115bb0ff677b";
 id = 577b27b17cf7115bb0ff677c;
 loginName = "";
 mobile = 18611346020;
 nick = "\U8c37\U7269\U70d8\U7119\U5b66\U9662";
 resource =         (
 {
 h = 0;
 height = 0;
 id = 577b27c57cf7115bb0ff677e;
 isSubTitle = 0;
 tp = 2;
 txt = "\U8c37\U7269\U70d8\U7119\U5b66\U9662\U8058\U8bf7\U5728\U897f\U70b9\U4e13\U4e1a\U9886\U57df\U7684\U56fd\U5185\U9886\U519b\U4eba\U7269\Uff0c\U4e0d\U4f46\U6709\U4e94\U661f\U4e3b\U53a8\U3001\U70d8\U7119\U8fbe\U4eba\Uff0c\U66f4\U6316\U6398\U4e86\U4ece\U672a\U5728\U70d8\U7119\U5708\U6388\U8bfe\U7684\U6700\U725b\U4e1a\U5185\U5927\U5e08\U3002\U8c37\U7269\U6c99\U9f99\U90fd\U4f1a\U9080\U8bf7\U5404\U79cd\U5728\U67d0\U4e2a\U9886\U57df\U7279\U522b\U6709\U5f71\U54cd\U529b\U7684\U725b\U4eba\Uff0c\U5206\U4eab\U5305\U62ec\U6446\U76d8\U8bbe\U8ba1\U3001\U6dd8\U5b9d\U5f00\U5e97\U3001\U5fae\U535a\U8fd0\U8425\U3001\U63a2\U5e97\U88c5\U4fee\U5e76\U9080\U8bf7\U6709\U6570\U5341\U4e07\U7c89\U4e1d\U91cf\U7ea7\U7684\U70d8\U7119\U8fbe\U4eba\U5206\U4eab\U7ed9\U5b66\U5458\U4ed6\U4eec\U7684\U201c\U8d70\U7ea2\U201d\U5185\U529f\Uff0c\U624b\U628a\U624b\U6559\U4f60\U5f00\U4e00\U5bb6\U81ea\U5df1\U7684\U5c0f\U5e97\U3002";
 url = "http://7xnqn3.com2.z0.glb.qiniucdn.com/577b27c57cf7115bb0ff677e";
 w = 0;
 width = 0;
 x = 0;
 y = 0;
 }
 );
 shareUrl = "http://www.songguolife.com/nuts/#/user/577b27b17cf7115bb0ff677c";
 showSocialInfo = 0;
 signature = "";
 source = 0;
 subStatus = 0;
 tp = 1;
 v = 0;
 weibo = "";
 weixin = "";
 };
 }
 */







@end
