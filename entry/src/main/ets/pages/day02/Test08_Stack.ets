@Entry
@Component
struct Test08_Stack {

  build() {
    Stack({alignContent: Alignment.BottomEnd}){
      Text('First child, show in bottom')
        .width('90%').height('100%')
        .backgroundColor(Color.Red)
        .align(Alignment.Top)
        .fontColor(Color.White)
        .fontSize(25)
      Text('Second child, show in top')
        .width('70%').height('60%')
        .backgroundColor(Color.Green)
        .align(Alignment.Top)
        .fontColor(Color.White)
        .fontSize(25)
    }.width('100%').height(250).margin({top:5})
  }
}