/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-19 17:26
 */
import router from '@ohos.router';

interface ItemModel {
  imagePath: Resource;
  text: string;
  actionUrl?: string;
  //action: (actionUrl: string)=>void;
}

//@Entry
//@Preview
@Component
export default struct LoginApproach {

  @State items: Array<ItemModel> =[
    {
      imagePath: $r('app.media.face_id'),
      text: '面容ID登录',
      actionUrl: 'pages/Index'
    },
    {
      imagePath: $r('app.media.wechat'),
      text: '微信登录',
      actionUrl: 'pages/Index'
    },
    {
      imagePath: $r('app.media.apple_id'),
      text: 'Apple ID登录',
      actionUrl: 'pages/Index'
    },
    {
      imagePath: $r('app.media.gesture'),
      text: '手势登录',
      actionUrl: 'pages/Index'
    }
  ];

  @Link switchLoginApproach:boolean;

  @Builder
  buildItem(itemModel: ItemModel){
    Row(){
      Image(itemModel.imagePath).width(30)
      Text(itemModel.text).fontSize(22).fontWeight(FontWeight.Bold)
    }.width('100%').margin(20).border({ width: { bottom: 1 }, color: Color.Gray }).justifyContent(FlexAlign.Center)
    .onClick(()=>{
      router.replaceUrl({ url: itemModel.actionUrl });
    })
  }

  build() {
    Column() {
      Row(){
        Image($r('app.media.close_login_approach'))
          .width(20)
          .onClick(()=>{
            this.switchLoginApproach = false;
          })
      }.width('100%').justifyContent(FlexAlign.End)
      ForEach(this.items, (item, index)=>{
        this.buildItem(item);
      }, (item, index)=>index.toString());
    }.padding(30)
  }

}