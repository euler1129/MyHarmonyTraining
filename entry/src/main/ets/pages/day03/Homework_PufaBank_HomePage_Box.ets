/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-16 10:54
 */
import { Size } from '@ohos/hypium'
import router from '@ohos.router';
import CardModel from './CardModel';
//@Preview
@Component
export default struct Homework_PufaBank_HomePage_Box{
  @Prop boxTitle:string;
  @Prop isShowBarMore:boolean;

  @BuilderParam boxContent:()=>void

  @Prop actionUrl: string;

  build(){
    Column(){
      Row(){
        Text(`${this.boxTitle}`).fontSize(16).fontWeight(FontWeight.Bold).fontColor('#2E3247')
        Text('更多').fontSize(12).fontColor(Color.Gray)
          .onClick(()=>{
            router.replaceUrl({ url: this.actionUrl })
          })
      }.width('100%')
      .padding(5)
      .justifyContent(FlexAlign.SpaceBetween)

      Row(){
        this.boxContent();
      }.width('100%')
      Row(){
        Text('更多').fontSize(12).fontColor('#B1D6F3')
      }.width('100%')
      .backgroundColor('#FFFFFF')
      .justifyContent(FlexAlign.Center)
      .visibility(this.isShowBarMore ? Visibility.Visible : Visibility.Hidden)
      .onClick(()=>{
        router.replaceUrl({ url: this.actionUrl })
      })
    }.width('100%')
    .backgroundColor('#F7F8FC')
  }
}