/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 17:01
 */
@Entry
@Component
struct TouchExample{
  @State text: string = 'eventType: string = ';

  build(){
    Column(){
      Button('Touch').height(50).width(200).margin(20).onTouch((event: TouchEvent) => {
        if(event.type===TouchType.Down){
          this.text = 'Down'
        }
        if(event.type===TouchType.Up){
          this.text = 'Up'
        }
        if(event.type===TouchType.Move){
          this.text = 'Move'
        }
        if(event.type===TouchType.Cancel){
          this.text = 'Cancel'
        }

      })
      Text(this.text)
    }.width('100%')

  }
}