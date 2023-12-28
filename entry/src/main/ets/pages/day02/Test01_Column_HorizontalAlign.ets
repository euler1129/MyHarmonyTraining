@Entry
@Component
struct Test01_Column_HorizontalAlign {
  @State message: string = 'Hello World'

  build() {
    Column({}){
      Column(){}.width('80%').height(50).backgroundColor(Color.Yellow)
      Column(){}.width('80%').height(50).backgroundColor(Color.Red)
      Column(){}.width('80%').height(50).backgroundColor(Color.Green)
    }.width('100%').alignItems(HorizontalAlign.Start).backgroundColor('rgb(242,242,242)')
  }
}