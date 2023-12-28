/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-25 14:55
 */
import MediaHelper from '../../utils/MediaHelper';
import MediaModel from '../../viewmodel/MediaModel';
import common from '@ohos.app.ability.common';
import { MediaOption } from '../../enums/MediaOption';

//@Entry
@Preview
@Component
export struct SelectPictureOrFile_TakePhoto {
  @State mediaModel: MediaModel = new MediaModel();
  private mediaHelper: MediaHelper = new MediaHelper(getContext());

  @Link url: string;

  build() {
    Row() {
      Column() {
        Text('选择图片')
          .textAlign(TextAlign.Center)
          .width(200)
          .fontSize(16)
          .padding(10)
          .margin(20)
          .border({ width: 0.5, color: '#ff38f84b', radius: 15 })
          .onClick(() => {
            this.handleClick(MediaOption.Picture)
          })

        Text('选择文件')
          .textAlign(TextAlign.Center)
          .width(200)
          .fontSize(16)
          .padding(10)
          .margin(20)
          .border({ width: 0.5, color: '#ff38f84b', radius: 15 })
          .onClick(() => {
            this.handleClick(MediaOption.File)
          })

        Text('拍照')
          .textAlign(TextAlign.Center)
          .width(200)
          .fontSize(16)
          .padding(10)
          .margin(20)
          .border({ width: 0.5, color: '#ff38f84b', radius: 15 })
          .onClick(() => {
            this.handleClick(MediaOption.TakePhoto)
          })

        Divider()
          .width('100%')
          .height(0.5)
          .color('#ff99f6a2')
          .margin({ top: 20 })
          .padding({ left: 20, right: 20 })

        Text(`文件名称: ${this.mediaModel.getFileName() ? this.mediaModel.getFileName() : ''}`)
          .textAlign(TextAlign.Center)
          .width('100%')
          .fontSize(16)
          .margin(10)

        Text(`文件大小: ${this.mediaModel.getFileSize() ? this.mediaModel.getFileSize() : ''}`)
          .textAlign(TextAlign.Center)
          .width('100%')
          .fontSize(16)
          .margin(10)

        Text(`文件类型: ${this.mediaModel.getFileType() ? this.mediaModel.getFileType() : ''}`)
          .textAlign(TextAlign.Center)
          .width('100%')
          .fontSize(16)
          .margin(10)

        Text(`文件Uri: ${this.mediaModel.getLocalUrl() ? this.mediaModel.getLocalUrl() : ''}`)
          .textAlign(TextAlign.Center)
          .width('100%')
          .fontSize(16)
          .margin(10)

        Image(this.mediaModel.getLocalUrl())
          .width(300)
          .height(300)
          .backgroundColor(Color.Grey)

      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }

  async handleClick(option: MediaOption) {
    let mediaModel: MediaModel;
    switch (option) {
      case MediaOption.Picture:
        mediaModel = await this.mediaHelper.selectPicture();
        break;
      case MediaOption.File:
        mediaModel = await this.mediaHelper.selectFile();
        break;
      case MediaOption.TakePhoto:
        mediaModel = await this.mediaHelper.takePhoto(getContext() as common.UIAbilityContext);
        break;
      default:
        break;
    }

    if (mediaModel) {
      this.mediaModel = mediaModel;
      this.url = mediaModel.getLocalUrl();
    }
  }

}

