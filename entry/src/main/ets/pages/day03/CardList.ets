/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-16 13:42
 */
import CardModel from './CardModel';
import Card from './Card';
@Entry
@Component
struct CardList{
  @State message: string = 'Hello World'

  cardModels:CardModel[] =[
    new CardModel(JSON.stringify($r('app.media.zhaoshang_card')),'招商银行','储蓄卡','4392****6692', true),
    new CardModel(JSON.stringify($r('app.media.zhaoshang_card')),'招商银行','信用卡','4392****8888', false)
  ]
  otherCardModels:CardModel[] =[
    new CardModel(JSON.stringify($r('app.media.zhaoshang_card')),'天津出行乘车码','','', false)
  ]
  getCardCount(models: CardModel[]):number{
    return models.length;
  }

  build(){
    Column(){
      Row(){
        Card({cardTitle: '银行卡',cardCount: this.getCardCount(this.cardModels),actionName:'添加银行卡',actionUrl:'pages/Index'}){
          ForEach(this.cardModels,(cardModel,index)=>{
            Row(){
              Column(){
                //this.cardImage();
                Image(JSON.parse(cardModel.cardImage)).width('100%')
                //Image($r('app.media.zhaoshang_card')).width('100%')
              }.width('30%').margin(5)
              Column(){
                Row(){
                  Text(`${cardModel.cardName}`).fontSize(16).fontWeight(FontWeight.Bold)
                  Text(`${cardModel.cardType}`).fontSize(10).margin(5)
                }.width('100%').justifyContent(FlexAlign.Start)
                Row(){
                  Column(){
                    Text(`${cardModel.cardNumber}`).fontWeight(FontWeight.Bold)
                  }
                  Flex({justifyContent:FlexAlign.Start, alignItems: ItemAlign.Center}){
                    Image($r('app.media.star')).width(20)
                    Text("默认")
                  }.width('25%').margin({left:10})
                  .visibility(cardModel.isDefault ? Visibility.Visible : Visibility.Hidden)
                  .backgroundColor(Color.Pink)
                }.width('100%')
              }.width('70%').margin(5)
            }
          },index=>index)
        }
      }.width('100%')
      Row(){
        Card({cardTitle: '会员.出行.证件',cardCount: this.getCardCount(this.otherCardModels),actionName:'去添加',actionUrl:'pages/Index'}){
          ForEach(this.otherCardModels,(cardModel,index)=>{
            Row(){
              Column(){
                //this.cardImage();
                Image(JSON.parse(cardModel.cardImage)).width('100%')
                //Image($r('app.media.zhaoshang_card')).width('100%')
              }.width('30%').margin(5)
              Column(){
                Row(){
                  Text(`${cardModel.cardName}`).fontSize(16).fontWeight(FontWeight.Bold)
                  Text(`${cardModel.cardType}`).fontSize(10).margin(5)
                }.width('100%').justifyContent(FlexAlign.Start)
                Row(){
                  Column(){
                    Text(`${cardModel.cardNumber}`).fontWeight(FontWeight.Bold)
                  }
                  Flex({justifyContent:FlexAlign.Start, alignItems: ItemAlign.Center}){
                    Image($r('app.media.star')).width(20)
                    Text("默认")
                  }.width('25%').margin({left:10})
                  .visibility(cardModel.isDefault ? Visibility.Visible : Visibility.Hidden)
                  .backgroundColor(Color.Pink)
                }.width('100%')
              }.width('70%').margin(5)
            }
          },index=>index)
        }
      }.width('100%')

    }.width('100%').height('100%')
  }
}