@Entry
@Component
struct Test05_Flex {

  build() {
    Column({space:20}){
      Flex({direction: FlexDirection.Row}){
        Text('1').width('20%').height(50).backgroundColor(0xF3D1B1)
        Text('2').width('20%').height(50).backgroundColor(0xF6D4E4)
        Text('3').width('20%').height(50).backgroundColor(0xF3D1B1)
        Text('4').width('20%').height(50).backgroundColor(0xF6D4E4)
      }.height(70).width('90%').padding(10).backgroundColor(0xAFEEEE)
      Flex({direction: FlexDirection.Column}){
        Text('1').width('100%').height(40).backgroundColor(0xF3D1B1)
        Text('2').width('100%').height(40).backgroundColor(0xF6D4E4)
        Text('3').width('100%').height(40).backgroundColor(0xF3D1B1)
        Text('4').width('100%').height(40).backgroundColor(0xF6D4E4)
      }.height(160).width('90%').padding(10).backgroundColor(0xAFEEEE)
    }.width('100%').margin({top:5})
  }
}