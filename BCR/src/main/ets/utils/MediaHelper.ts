/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-25 14:08
 */
import MediaModel from '../viewmodel/MediaModel';
import picker from '@ohos.file.picker';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import common from '@ohos.app.ability.common';
import wantConstant from '@ohos.ability.wantConstant';
import StringUtils from './StringUtils';

export default class MediaHelper {

  private context: common.Context;

  constructor(context: common.Context) {
    this.context = context;
  }

  private async appendFileInfoToMediaBean(mediaModel: MediaModel, uri: string) {
    if (StringUtils.isNotNullOrEmpty(uri)) {
      return null;
    }

    let fileList: Array<mediaLibrary.FileAsset> = [];

    const parts: string[] = uri.split('/');
    const id: string = parts.length > 0 ? parts[parts.length - 1] : '-1';

    try {
      let media = mediaLibrary.getMediaLibrary(this.context);
      let mediaFetchOptions: mediaLibrary.MediaFetchOptions = {
        selections: mediaLibrary.FileKey.ID + '= ?',
        selectionArgs: [id],
        uri: uri
      };

      let fetchFileResult = await media.getFileAssets(mediaFetchOptions);
      fileList = await fetchFileResult.getAllObject();
      fetchFileResult.close();
      await media.release();

    } catch (e) {
    }

    if (fileList && fileList.length > 0) {
      let fileInfoObj = fileList[0];
      mediaModel.setFileName(fileInfoObj.displayName);
      mediaModel.setFileSize(fileInfoObj.size);
      mediaModel.setFileType(fileInfoObj.mimeType);
    }
  }

  private async buildMediaModel(uri: string): Promise<MediaModel> {
    if (StringUtils.isNotNullOrEmpty(uri)) {
      return null;
    }

    const mediaModel: MediaModel = new MediaModel();
    mediaModel.setLocalUrl(uri);
    await this.appendFileInfoToMediaBean(mediaModel, uri);
    return mediaModel;
  }

  public selectPicture(): Promise<MediaModel> {
    try {
      let photoSelectOptions = new picker.PhotoSelectOptions();
      photoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
      photoSelectOptions.maxSelectNumber = 1;
      let photoPicker = new picker.PhotoViewPicker();
      return photoPicker.select(photoSelectOptions)
        .then((photoSelectResult) => {
          if (photoSelectResult && photoSelectResult.photoUris && photoSelectResult.photoUris.length > 0) {
            let filePath = photoSelectResult.photoUris[0];
            return filePath;
          }
        }).catch((err) => {
          return err;
        }).then(async (filePath) => {
          return await this.buildMediaModel(filePath);
        });
    } catch (err) {
      return Promise.reject(err);
    }
  }

  public selectFile(): Promise<MediaModel> {
    try {
      let documentSelectOptions = new picker.DocumentSelectOptions();
      let documentPicker = new picker.DocumentViewPicker();
      return documentPicker.select(documentSelectOptions)
        .then((documentSelectResult) => {
          if (documentSelectResult && documentSelectResult.length > 0) {
            let filePath = documentSelectResult[0];
            return filePath;
          }
        }).catch((err) => {
          return err;
        }).then(async (filePath) => {
          return await this.buildMediaModel(filePath);
        });
    } catch (err) {
      return Promise.reject(err);
    }
  }

  public async takePhoto(context: common.UIAbilityContext): Promise<MediaModel> {
    let want = {
      'uri': '',
      'action': wantConstant.Action.ACTION_IMAGE_CAPTURE,
      'parameters': {},
    };
    return context.startAbilityForResult(want)
      .then((result) => {
        if (result.resultCode === 0 && result.want && !StringUtils.isNotNullOrEmpty(result.want.uri)) {
          return result.want.uri;
        }
      }).catch((error) => {
        return error;
      }).then(async (uri: string) => {
        return await this.buildMediaModel(uri);
      });
  }

}