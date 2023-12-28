@Entry
@Component
struct Test02_Column_FlexAlign {
  @State message: string = 'Hello World'

  build() {
    Column({}){
      Column(){}.width('80%').height(50).backgroundColor(Color.Yellow)
      Column(){}.width('80%').height(50).backgroundColor(Color.Red)
      Column(){}.width('80%').height(50).backgroundColor(Color.Green)
    }.width('100%').height(300).justifyContent(FlexAlign.SpaceBetween).backgroundColor('rgb(2402,202,202)')
  }
}