/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-25 15:22
 */
import { SelectPictureOrFile_TakePhoto } from 'picture_file_takephoto_library/src/main/ets/components/picture_file_takephoto/SelectPictureOrFile_TakePhoto'
import router from '@ohos.router';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct SelectPictureOrFile_TakePhoto_TestPage {
  @State url: string = '';

  build() {
    Column(){
      Row() {
        SelectPictureOrFile_TakePhoto({ url: $url })
      }
      .width('100%')
      .height('90%')
      Row() {
        Button('Go to BCR test!')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            // router.pushUrl({
            //   url: 'pages/BCR_TestPage2',
            //   params: {
            //     "imageUrl": this.url
            //   }
            // }, router.RouterMode.Single);
            let want = {
              deviceId: '',
              bundleName: 'com.example.myharmonytraining',
              abilityName: 'bcr/src/main/ets/bcrability/BCRAbility',
              moduleName: 'BCR'
            };
            let context = getContext(this) as common.UIAbilityContext;
            context.startAbility(want, (error) => {
              console.log('error.code = ' + error.code)
            });
          })
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')

  }

}