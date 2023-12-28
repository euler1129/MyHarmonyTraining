/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 15:14
 */

@Entry
@Component
struct PositionExample{
  @Builder
  myline(){
    Text('1').height(50).width('33%').fontSize(16).backgroundColor(0xFDEB3).textAlign(TextAlign.Start)
    Text('2').height(50).width('33%').fontSize(16).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
    Text('3').height(50).width('33%').fontSize(16).backgroundColor(0xFDEB3).textAlign(TextAlign.End)
  }
  build(){
    Column({ space: 10 }){
      Row(){
        this.myline();
      }.width('90%').direction(Direction.Auto)
      Row(){
        this.myline();
      }.width('90%').direction(Direction.Rtl)

    }.width('100%').margin({top: 5})

  }

}
