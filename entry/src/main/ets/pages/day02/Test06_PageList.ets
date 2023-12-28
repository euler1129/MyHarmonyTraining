@Entry
@Component
struct Test06_PageList {
  private arr:number[] = [0,1,2,3,4,5,6,7,8,9]

  build() {
    Column(){
      List({space: 20, initialIndex:0 }){
        ForEach(this.arr, (item, index)=>{
          ListItem(){
            if (index % 2 == 0) {
              Text(''+item).width('100%').height(100).fontSize(16).textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
            } else {
              Text(''+item).width('100%').height(100).fontSize(16).textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFCC)
            }

          }
        },(item, index)=>index+'')
      }
      .listDirection(Axis.Vertical)
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20})
      .edgeEffect(EdgeEffect.Spring)
      .onScrollIndex((firstIndex: number, lastIndex: number)=>{
        console.error("first"+firstIndex)
        console.error("last"+lastIndex)
      })
      .width('90%')
    }.width('100%').height('100%').padding({top:5}).backgroundColor(0xDCDCDC)
  }
}