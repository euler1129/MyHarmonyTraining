/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-25 16:36
 */
import router from '@ohos.router';
import testNapi from 'libbcr.so';

@Entry
@Component
struct BCR_TestPage2 {

  @State message: string = 'Test NAPI 2 + 3 = ?'
  @State url: string = '';
  @State number: string = '';

  imageUrl: string;

  aboutToAppear(){
    this.imageUrl = router.getParams()["imageUrl"];
  }

  build() {
    Column() {
      Row() {
        Text(this.message)
          .width('100%')
          .textAlign(TextAlign.Center)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .margin({ top: 30 })
      Row(){
        Button('Calculate')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            let result = testNapi.add(2, 3);
            this.message = `Test NAPI 2 + 3 = ${result}`;
            console.log('Test NAPI 2 + 3 = ?', result);
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 30 })
      Row(){
        Image(this.url)
          .width(300)
          .height(200)
          .backgroundColor(Color.Grey)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 30 })
      Row() {
        Text(this.number)
          .width('100%')
          .textAlign(TextAlign.Center)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Red)

      }
      .width('100%')
      .margin({ top: 30 })
      Row(){
        Button('Recognize')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            console.log('image url: ', this.url);
            // this.number = testNapi.rec(this.url);
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 30 })
    }
    .height('100%')
    .padding(10)
  }

}