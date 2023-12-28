@Entry
@Component
struct Test04_Row_FlexAlign {
  @State message: string = 'Hello World'

  build() {
    Row({}){
      Column(){}.width('20%').height(30).backgroundColor(Color.Yellow)
      Column(){}.width('20%').height(30).backgroundColor(Color.Red)
      Column(){}.width('20%').height(30).backgroundColor(Color.Green)
    }.width('100%').height(300).backgroundColor('rgb(2402,202,202)')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}