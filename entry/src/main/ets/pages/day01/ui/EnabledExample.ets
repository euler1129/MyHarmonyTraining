/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 16:34
 */
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct EnabledExample{
  build(){
    Column({space: 10}){
      Button('disable').fontSize(50).enabled(false).backgroundColor(Color.Gray).opacity(0.4)
      Button('enable').fontSize(50).backgroundColor(Color.Blue).onClick(()=>{
        try {
          promptAction.showToast({
            message: 'enable',
            duration: 2000,
          });
        } catch (error) {
          console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
        };
      })
    }
    .margin(10)
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}