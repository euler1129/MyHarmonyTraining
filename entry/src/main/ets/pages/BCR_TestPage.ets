/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-25 16:36
 */
import { NAPITest } from 'bcr/src/main/ets/pages/NAPITest'
import router from '@ohos.router';

@Entry
@Component
struct BCR_TestPage {
  imageUrl: string;

  aboutToAppear(){
    this.imageUrl = router.getParams()["imageUrl"];
  }

  build() {
    Column() {
      NAPITest({ url: this.imageUrl })
    }
    .width('100%')
    .height('100%')
  }

}