/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 17:24
 */
@Entry
@Component
struct ChangeExample{
  password: String;
  build(){
    Row(){
      Column(){
        TextInput({placeholder: 'input your password'})
          .width(400).height(60).fontSize(40)
          .margin(20).type(InputType.Password)
          .maxLength(18)
          .showPasswordIcon(true)
          .onChange(value => {
            this.password = value;
            console.log('password: ' + this.password);
          })
      }.width('100%')
    }.height('100%')
  }
}