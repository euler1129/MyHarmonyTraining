/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 17:01
 */
@Entry
@Component
struct RadioExample{
  @State message: string = '大';
  @State fontSize: number = 30;
  @State wid: number = 60;

  build(){
    Row(){
      Column(){
        Radio({ value: 'Radio1', group: 'radioGroup'}).height(60).width(60).checked(true).onClick(()=>{

        })
        Radio({ value: 'Radio2', group: 'radioGroup'}).height(60).width(60).onClick(()=>{

        })
      }.width('100%')
    }.height('100%')
  }

}