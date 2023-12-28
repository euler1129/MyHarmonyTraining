/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 16:42
 */
@Entry
@Component
struct ClickExample{
  @State text: string = '';
  build(){
    Column(){
      Row({space:10}){
        Button('Click').width(200).height(50).onClick((event: ClickEvent) => {
          this.text = 'Click Point: \nscreenX:' + event.screenX + '\n screenY: ' + event.screenY +
                  '\n x: ' + event.x +
                  '\n y: ' + event.y +
                  '\n target: \n components globalPos:(' + event.target.area.globalPosition.x +
                  ', ' + event.target.area.globalPosition.y +
                  ')\n with: ' + event.target.area.width +
                  '\n height: ' + event.target.area.height +
                  '\n timestamp: ' + event.timestamp;

        })
      }
      Text(this.text).margin(10)
    }.width('100%')
  }
}