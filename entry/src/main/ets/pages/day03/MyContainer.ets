/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-16 09:28
 */
// @Preview
@Component
export default struct MyContainer{
  @Prop header:string;
  @BuilderParam content:()=>void
  @Prop footer:string;
  build(){
    Column(){
      Row(){
        Flex({justifyContent: FlexAlign.SpaceBetween}){
          Text(this.header)
          Image($r('app.media.plus')).onClick(()=>{
            console.log("添加");
          })
        }.margin(5)

      }.width('100%').height('10%').justifyContent(FlexAlign.SpaceBetween)

      Row(){
        Column(){
          this.content();
        }
      }.width('100%').height('30%')

      Row(){
        Image($r('app.media.plus_blue'))
        Text(this.footer)
      }.borderWidth(1)
      .borderStyle(BorderStyle.Dashed)
      .backgroundColor(Color.Yellow)
      .width('100%')
      .onClick(()=>{
        console.log("添加");
      })

      // Text(this.message).onClick(()=>{
      //   this.message = "我是可改变父元素的";
      // })
      // Text(`${this.number}`).onClick(()=>{
      //   this.number += 1;
      // })
    }
  }
}