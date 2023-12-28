/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 17:01
 */
@Entry
@Component
struct ScaleExample{
  @State message: string = '大';
  @State fontSize: number = 30;
  @State wid: number = 60;

  build(){
    Row(){
      Column(){
        Button(this.message)
          .width(this.wid).height(this.wid).backgroundColor(Color.Blue)
          .fontSize(this.fontSize).type(ButtonType.Circle).stateEffect(true)
          .onClick(()=>{
            this.fontSize += 10;
            this.wid += 20;
          })
      }.width('100%')
    }.height('100%')
  }

}