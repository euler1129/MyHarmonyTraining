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
export default struct Card{
  @Prop cardTitle:string;
  @Prop cardCount:number;

  @BuilderParam cardContent:()=>void

  @Prop actionName: string;
  @Prop actionUrl: string;

  build(){
    Column(){
      Row(){
        Text(`${this.cardTitle}(${this.cardCount})`).fontSize(16).fontWeight(FontWeight.Bold)
        Image($r('app.media.plus')).width('10%').onClick(()=>{
          router.replaceUrl({ url: this.actionUrl })
        })
      }.width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      Column(){
        this.cardContent();
      }.width('100%')
      Flex({justifyContent:FlexAlign.Center, alignItems: ItemAlign.Center}){
        Image($r('app.media.plus_blue')).width('5%')
        Text(`${this.actionName}`).fontColor(Color.Red).fontSize(16).fontWeight(FontWeight.Bold).margin(10)
      }.width('100%')
      .onClick(()=>{
        router.replaceUrl({ url: this.actionUrl })
      })
    }.width('100%')
  }
}