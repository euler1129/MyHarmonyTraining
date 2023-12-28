import router from '@ohos.router';
import DigitObject from './DigitObject';
import LoginApproach from './LoginApproach';
import SecureKeyboard from './SecureKeyboard';
// import SecureKeyboardDialog from './SecureKeyboardDialog';


@Entry
@Component
struct Homework_LoginPage {
  @State name: string = "琦";
  @State currentId: string = '1';
  @State currentValues: string[] = ['', '', '', '', ''];
  @State numList: Array<DigitObject> = [
    {
      id: '1',
      val: ''
    },
    {
      id: '2',
      val: ''
    },
    {
      id: '3',
      val: ''
    },
    {
      id: '4',
      val: ''
    },
    {
      id: '5',
      val: ''
    },
    {
      id: '6',
      val: ''
    }
  ];
  @State switchLoginApproach: boolean = false;
  @State isShowSecureKeyboard: boolean = false;

  // onAccept = ()=>{
  //   this.dialogController.close();
  // }
  // dialogController: CustomDialogController = new CustomDialogController({
  //   builder: SecureKeyboardDialog({
  //     numList: $numList,
  //     currentId: $currentId,
  //     currentValues: $currentValues,
  //     confirm: this.onAccept
  //   }),
  //   customStyle: true,
  //   alignment: DialogAlignment.Bottom
  // })

  build() {
    Column() {
      Row() {
        Column() {
          Text('X').textAlign(TextAlign.Center).width(50).height(50)
        }

        Column() {
          Text('?')
            .textAlign(TextAlign.Center)
            .width(20)
            .height(20)
            .margin(10)
            .border({ width: 1, radius: 50 })
        }
      }
      .width('100%')
      .margin(5)
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text(`Hi ${this.name}\n晚上好,欢迎回来`)
          .width('100%').fontSize(36).fontWeight(FontWeight.Bold)
          .margin(10)
      }
      .width('100%')

      Row() {
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Column() {
            TextInput({ text: '158****5024' })
              .height(60)
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .backgroundColor('#fff')
              .maxLength(11)
              .type(InputType.Number)
          }.width('60%')

          Column() {
            Row() {
              Text('切换手机号').fontColor('#336699') //.margin({right: 30})
              Image($r('app.media.arrow_down')).width(12).margin({ left: 15 })
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .alignItems(VerticalAlign.Center)
          }.width('40%')
        }
        .width('100%')
        //.margin({top: 10})
        .border({ width: { bottom: '2px' }, color: '#ccc' })
      }
      .padding(10)

      Row() {
        ForEach(this.numList, (item, index) => {
          Column() {
            TextInput({ text: this.currentValues[item.id-1] })
              .textAlign(TextAlign.Start)
              .width(60)
              .backgroundColor('#fff')
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .maxLength(1)
              .type(InputType.Number)
              .focusable(true)
                // .focusOnTouch(item.id === '1')
              .key(item.id)
              .onChange((val) => {
                this.numList[index].val = val
                let el = this.numList[val ? index + 1 : index - 1]
                if (undefined !== el) {
                  focusControl.requestFocus(el.id);
                }
              })
              .onFocus(() => {
                this.isShowSecureKeyboard = true;
                // animateTo({
                //   duration: 200,
                // }, () => {
                //   this.dialogController.open();
                // });
              })
              .onBlur(() => {
                this.isShowSecureKeyboard = false;
              })
          }.padding({ bottom: 10 })
          .border({ width: { bottom: '2px' }, color: '#ccc' })
          .width(40)
        }, item => item.id)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(5)

      Row() {
        Text('忘记密码 ？').fontColor('#336699')
      }.width('100%').justifyContent(FlexAlign.Start)
      .margin({ left: 15 })
      .padding(5)

      Row() {
        Column() {
          Image($r('app.media.arrow_right')).width(60)
        }
        .padding(20)
        .borderRadius(60)
        .onClick(() => {
          if (this.currentId === '6') {
            router.pushUrl({ url: 'pages/day03/Homework_PufaBank_HomePage' })
          }
        })
      }.width('100%').justifyContent(FlexAlign.End).margin({ top: 15 })

      Row() {
        Text('切换登录方式')
          .fontColor('#336699')
          .fontSize(20)
          .margin({top: this.isShowSecureKeyboard ? 15 : 150})
          //.margin({ top: 150 })
          .visibility(!this.switchLoginApproach ? Visibility.Visible : Visibility.None)
          .onClick(() => {
            this.switchLoginApproach = true;
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      Row() {
        LoginApproach({ switchLoginApproach: $switchLoginApproach })
          .visibility(this.switchLoginApproach ? Visibility.Visible : Visibility.None)
      }
      .width('100%')

      Row() {
        SecureKeyboard({numList: $numList, currentId: $currentId, currentValues: $currentValues})
          .visibility(this.isShowSecureKeyboard ? Visibility.Visible : Visibility.None)
      }.width('100%')
    }

  }
}