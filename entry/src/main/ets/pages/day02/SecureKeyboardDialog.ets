/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-19 17:23
 */
import DigitObject from './DigitObject';

//@Entry
//@Preview
//@Component
@CustomDialog
export default struct SecureKeyboardDialog {
  controller: CustomDialogController;
  private generatedDigits: string[] = [];
  @State arr: Array<string>[] = [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['S', '0', 'B']];

  @Link currentId: string;
  @Link numList: Array<DigitObject>;
  @Link currentValues: string[];

  confirm: () => void;

  getRandom(): string{
    return Math.floor(Math.random() * 10).toString();
  }

  getDigitObject(id:string):DigitObject{
    let targetObject = {
      id: '-1',
      val: ''
    };
    this.numList.forEach((digitObject,index)=>{
      if(digitObject.id === id){
        targetObject = digitObject;
        return;
      }
    }, index => index);
    return targetObject;
  }

  @Builder
  buildDigit(item: string) {
    if (item === 'S'){
      Text('随机')
        .width('32%')
        .height(50)
        .textAlign(TextAlign.Center)
        .border({ radius: 5 })
        .backgroundColor(Color.White)
        .onClick(() => {
          //let that = this;
          this.generatedDigits = [];
          while (this.generatedDigits.length != 10){
            let digit = this.getRandom();
            if(!this.generatedDigits.includes(digit)){
              this.generatedDigits.push(digit);
            }
          }
          let i = 0;
          let arrTemp: Array<string>[] = [['', '', ''], ['', '', ''], ['', '', ''], ['S', '', 'B']];
          this.arr.forEach((line,index1) =>{
            line.forEach((digitText,index2) =>{
              if (digitText === 'S' || digitText === 'B') {
                return;
              }
              arrTemp[index1][index2] = this.generatedDigits[i];
              i++;
            })
          });
          this.arr = arrTemp;
        })
    } else if (item === 'B'){
      Image($r('app.media.backspace'))
        .width('32%')
        .height(50)
        .border({ radius: 5 })
        .onClick(() => {
          this.currentValues[parseInt(this.currentId) - 1] = '';
          this.currentId = (parseInt(this.currentId) - 1).toString();
          if (parseInt(this.currentId) < 1) {
            this.currentId = '1';
          }
        })
    } else {
      Text(item)
        .width('32%')
        .height(50)
        .textAlign(TextAlign.Center)
        .border({ radius: 5 })
        .backgroundColor(Color.White)
        .onClick(() => {
          let digitObject = this.getDigitObject(this.currentId);
          digitObject.val = item;
          this.currentValues[parseInt(this.currentId) - 1] = digitObject.val;
          this.currentId = (parseInt(this.currentId) + 1).toString();
          if (parseInt(this.currentId) > 6) {
            this.currentId = '6';
            this.controller.close();
          }
        })
    }

  }

  @Builder
  buildRow(arr: string[]) {
    Row() {
      ForEach(arr, item => {
        this.buildDigit(item);
      }, item => JSON.stringify(item));
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 10, right: 10, top: 5 })
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.pufa_logo')).width(30)
        Text('浦发银行安全键盘').fontSize(22).margin({ left: 10 })
      }
      .width('100%')
      .height(50)
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)

      ForEach(this.arr, item => {
        this.buildRow(item);
      }, index => index);
    }.padding(10).backgroundColor('#EEEFF3')
  }

}