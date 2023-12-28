@Entry
@Component
struct Test07_Swiper {

  build() {
    Swiper(){
      Text('01').fontSize(36).textAlign(TextAlign.Center).width('100%').height('100%').backgroundColor(Color.Red)
      Text('02').fontSize(36).textAlign(TextAlign.Center).width('100%').height('100%').backgroundColor(Color.Green)
      Text('03').fontSize(36).textAlign(TextAlign.Center).width('100%').height('100%').backgroundColor(Color.Blue)
      // Image($r('app.media.icon'))
      // Image($r('app.media.icon'))
      // Image($r('app.media.icon'))
    }.width('94%').height(200).margin(10).borderRadius(10)
    .loop(true).autoPlay(true).interval(1000)
    .indicatorStyle({ size: 30, color: Color.Yellow })
    .onChange((index:number)=>{
      console.log("index: ", index)
    })
  }
}