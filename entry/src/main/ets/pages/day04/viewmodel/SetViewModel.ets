
import CommonConstants from '../common/constants/CommonConstants';
import ChatData from '../viewmodel/ChatData';
import { ItemDirection } from '../viewmodel/ItemDirection';

/**
 * Set view model, providing page display data.
 */
export class SetViewModel {
  chatArr: Array<ChatData> = [];

  initChatData(): Array<ChatData> {
    if (this.chatArr.length === 0) {
      this.chatArr = new Array();
      let chatData = new ChatData();
      chatData.itemDirection = ItemDirection.RIGHT;
      chatData.content = $r('app.string.set_chat_content1');
      this.chatArr.push(chatData);
      chatData = new ChatData();
      chatData.itemDirection = ItemDirection.LEFT;
      chatData.content = $r('app.string.set_chat_content2');
      this.chatArr.push(chatData);
      chatData = new ChatData();
      chatData.itemDirection = ItemDirection.RIGHT;
      chatData.content = $r('app.string.set_chat_content3');
      this.chatArr.push(chatData);
      chatData = new ChatData();
      chatData.itemDirection = ItemDirection.LEFT;
      chatData.content = $r('app.string.set_chat_content4');
      this.chatArr.push(chatData);
    }
    return this.chatArr;
  }

  getTextByFontSize(fontSize: number) {
    let fontSizeText: Resource | string = '';
    switch (fontSize) {
      case CommonConstants.SET_SIZE_SMALL:
        fontSizeText = $r('app.string.set_size_small');
        break;
      case CommonConstants.SET_SIZE_NORMAL:
        fontSizeText = $r("app.string.set_size_normal");
        break;
      case CommonConstants.SET_SIZE_LARGE:
        fontSizeText = $r("app.string.set_size_large");
        break;
      case CommonConstants.SET_SIZE_EXTRA_LARGE:
        fontSizeText = $r("app.string.set_size_extra_large");
        break;
      case CommonConstants.SET_SIZE_HUGE:
        fontSizeText = $r("app.string.set_size_huge");
        break;
      default:
        fontSizeText = $r("app.string.set_size_normal");
    }
    return fontSizeText;
  }
}

export default new SetViewModel();