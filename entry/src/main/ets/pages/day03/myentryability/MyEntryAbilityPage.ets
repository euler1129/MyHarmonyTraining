import common from '@ohos.app.ability.common'
import router from '@ohos.router'
@Entry
@Component
struct MyEntryAbilityPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Button('Click Me').onClick(()=>{
          let want = {
            deviceId: '',
            bundleName: 'com.example.myharmonytraining',
            abilityName: 'MyEntryAbility'
          }
          let context = getContext(this) as common.UIAbilityContext
          context.startAbility(want)
          // router.pushUrl({url: "pages/Index"})
        })

        // Text(this.message)
        //   .fontSize(50)
        //   .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}