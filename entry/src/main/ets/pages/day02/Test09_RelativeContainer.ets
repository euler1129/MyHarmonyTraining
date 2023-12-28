@Entry
@Component
struct Test09_RelativeContainer {

  build() {
    Row(){
      RelativeContainer(){
        Row().width(100).height(100)
          .backgroundColor("#FF3333")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            left: {anchor: "__container__", align: HorizontalAlign.Start}
          })
          .id("row1")

        Row().width(100).height(100)
          .backgroundColor("#FFCC00")
          .alignRules({
            top: {anchor: "__container__", align: VerticalAlign.Top},
            right: {anchor: "__container__", align: HorizontalAlign.End}
          })
          .id("row2")
      }.width(300).height(300)
      .border({width:2, color: "#6699FF"})
    }.width('100%').height('100%').justifyContent(FlexAlign.Center)
  }
}