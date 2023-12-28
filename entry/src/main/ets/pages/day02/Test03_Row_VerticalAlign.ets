@Entry
@Component
struct Test03_Row_VerticalAlign {
  @State message: string = 'Hello World'

  build() {
    Row({}){
      Column(){}.width('20%').height(30).backgroundColor(Color.Yellow)
      Column(){}.width('20%').height(30).backgroundColor(Color.Red)
      Column(){}.width('20%').height(30).backgroundColor(Color.Green)
    }.width('100%').height(200).backgroundColor('rgb(242,242,242)')
    .alignItems(VerticalAlign.Center)
  }
}