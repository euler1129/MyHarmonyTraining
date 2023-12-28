
import SettingData from '../viewmodel/SettingData';
import StyleConstants from '../common/constants/StyleConstants';

/**
 * The setting list item component.
 */
@Component
export default struct SettingItemComponent {
  setting: SettingData = new SettingData();
  @Prop changeFontSize: number;// = 0;
  itemClick: Function = () => {
  };

  build() {
    Row() {
      Image(this.setting.settingImage)
        .height($r('app.float.setting_item_ic_size'))
        .width($r('app.float.setting_item_ic_size'))
        .margin({ left: $r('app.float.setting_ic_margin_left'), right: $r('app.float.setting_ic_margin_right') })

      Text(this.setting.settingName)
        .fontSize(this.changeFontSize + StyleConstants.UNIT_FP)
        .fontColor($r('app.color.text'))
        .fontWeight(FontWeight.Medium)
    }
    .width(StyleConstants.FULL_WIDTH)
    .height($r('app.float.setting_item_height'))
    .onClick(() => {
      this.itemClick();
    })
  }
}