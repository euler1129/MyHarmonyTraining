/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 18:41
 */

// @Preview
@Component
export struct Component1{
  @Link phone: string;
  // @State pwd: string='';
  // @State sexy: boolean=true;
  // @State pro: boolean=false;

  build(){
    Column(){
      Row(){
        Text('Phone:').width('40%').textAlign(TextAlign.Center)
        TextInput().type(InputType.PhoneNumber).width('60%').border({width: 1}).onChange(value => {
          this.phone = value;
        })
      }
      // Row(){
      //   Text('User ID:').width('40%').textAlign(TextAlign.Center)
      //   TextInput().type(InputType.Password).width('60%').border({width: 1}).showPasswordIcon(true).onChange(value => {
      //     this.pwd = value;
      //   })
      // }
      // Row(){
      //   Radio({ value: 'M', group: 'sexyGroup'}).checked(true).onChange(checked => {
      //     this.sexy = checked;
      //   })
      //   Text('Male')
      //   Radio({ value: 'F', group: 'sexyGroup'}).checked(true).onChange(checked => {
      //     this.sexy = !checked;
      //   })
      //   Text('Female')
      // }
      // Row(){
      //   Checkbox().onChange(checked => {
      //     this.pro = checked;
      //   })
      //   Text('XXX协议')
      // }
      // Row(){
      //   Button('Register').onClick(()=>{
      //
      //   })
      // }
    }


    // Row(){
    //   Column(){
    //     Text('User ID:')
    //   }.height('50%')
    //   Column(){
    //     TextInput()
    //   }.height('50%')
    // }.width('100%')
  }

}