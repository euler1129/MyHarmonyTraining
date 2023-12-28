/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 16:57
 */
@Entry
@Component
struct FocusEventExample {
  @State oneButtonColor: string = '#FFC0CB';
  @State twoButtonColor: string = '#87CEFA';
  @State threeButtonColor: string = '#90EE90';


  build() {
    Column({ space: 20 }) {
      // 通过外接键盘的上下键可以让焦点在三个按钮间移动，按钮获焦时颜色变化，失焦时变回原背景色
      Button('First Button')
        .backgroundColor(this.oneButtonColor)
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onFocus(() => {
          this.oneButtonColor = '#FF0000';
        })
        .onBlur(() => {
          this.oneButtonColor = '#FFC0CB';
        })
      Button('Second Button')
        .backgroundColor(this.twoButtonColor)
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onFocus(() => {
          this.twoButtonColor = '#FF0000';
        })
        .onBlur(() => {
          this.twoButtonColor = '#87CEFA';
        })
      Button('Third Button')
        .backgroundColor(this.threeButtonColor)
        .width(260)
        .height(70)
        .fontColor(Color.Black)
        .focusable(true)
        .onFocus(() => {
          this.threeButtonColor = '#FF0000';
        })
        .onBlur(() => {
          this.threeButtonColor = '#90EE90';
        })
    }.width('100%').margin({ top: 20 })
  }
}