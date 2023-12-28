/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 15:00
 */

@Entry
@Component
struct SizeExample{
  build(){
    Column({ space: 10 }){
      Row(){
        Row(){
          Row().size({ width: '100%', height: '100%'}).backgroundColor(Color.Yellow)
        }.width(80).height(80).padding(10).margin(20).backgroundColor(Color.White)
      }.backgroundColor(Color.Blue)
    }.width('100%').margin({ top: 5 })
  }
}