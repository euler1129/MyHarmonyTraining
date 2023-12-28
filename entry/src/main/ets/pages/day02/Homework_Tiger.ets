@Entry
@Component
struct Homework_Tiger {
  @State textChange: string ="";
  @State actionFlag: boolean =false;
  @State selectedIndex: number =0;
  timerInstance: number;

  build() {
    Column(){
      Row() {
        RelativeContainer() {
          Text("1").fontSize(32).fontColor(Color.White).textAlign(TextAlign.Center)
            .width(100).height(100)
            .backgroundColor(this.selectedIndex === 1 ? "#FF3333" : "#AAFF55")
            .alignRules({
              top: {anchor: "__container__", align: VerticalAlign.Top},
              left: {anchor: "__container__", align: HorizontalAlign.Start}
            }).id("row1")

          Text("2").fontSize(32).fontColor(Color.White).textAlign(TextAlign.Center)
            .width(100).height(100)
            .backgroundColor(this.selectedIndex === 2 ? "#FF3333" : "#FFCC00")
            .alignRules({
              top: {anchor: "__container__", align: VerticalAlign.Top},
              right: {anchor: "__container__", align: HorizontalAlign.End}
            }).id("row2")

          Text(this.textChange).fontSize(32).fontColor(Color.Red).textAlign(TextAlign.Center)
            .borderRadius(100)
            .borderWidth(1)
            .borderColor("#FF6633")
            .height(100)
              // .backgroundColor("#FF6633")
            .alignRules({
              top: {anchor: "row1", align: VerticalAlign.Bottom},
              left: {anchor: "row1", align: HorizontalAlign.End},
              right: {anchor: "row2", align: HorizontalAlign.Start}
            }).id("row3")

          Text("4").fontSize(32).fontColor(Color.White).textAlign(TextAlign.Center)
            .backgroundColor(this.selectedIndex === 4 ? "#FF3333" : "#FF9966")
            .alignRules({
              top: {anchor: "row3", align: VerticalAlign.Bottom},
              bottom: {anchor: "__container__", align: VerticalAlign.Bottom},
              left: {anchor: "__container__", align: HorizontalAlign.Start},
              right: {anchor: "row1", align: HorizontalAlign.End}
            }).id("row4")

          Text("3").fontSize(32).fontColor(Color.White).textAlign(TextAlign.Center)
            .backgroundColor(this.selectedIndex === 3 ? "#FF3333" : "#FF66FF")
            .alignRules({
              top: {anchor: "row3", align: VerticalAlign.Bottom},
              bottom: {anchor: "__container__", align: VerticalAlign.Bottom},
              left: {anchor: "row2", align: HorizontalAlign.Start},
              right: {anchor: "__container__", align: HorizontalAlign.End}
            }).id("row5")
        }
        .width(300).height(300)
        // .margin({left: 100})
        .border({width:2, color: "#6699FF"})

      }.width('100%').height('90%').justifyContent(FlexAlign.Center)
      Row(){
        Button(!this.actionFlag ? "开始" : "结束").width('100%').onClick((event:ClickEvent)=>{
          this.actionFlag = !this.actionFlag;
          console.log("actionFlag: " + this.actionFlag);
          if(this.actionFlag){
            this.timerInstance = setInterval(()=>{
              console.log("selectedIndex: " + this.selectedIndex);
              this.selectedIndex = this.selectedIndex++ >= 4 ? 0 : this.selectedIndex;
              if (this.selectedIndex != 0) {
                this.textChange = this.selectedIndex + '';
              }
            },200);
          }else{
            clearInterval(this.timerInstance);
          }
        })
      }.width('100%').margin({top:-300})

    }


  }
}