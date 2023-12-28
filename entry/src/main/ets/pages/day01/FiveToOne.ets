/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-15 18:37
 */
import { Component1 } from './components/Component1'
import { Component2 } from './components/Component2'
import { Component3 } from './components/Component3'
import { Component4 } from './components/Component4'
import { Component5 } from './components/Component5'

@Entry
@Component
struct FiveToOne {
  @State message: string = 'Hello World'

  @State phone: string='';
  @State pwd: string='';
  @State sexy: boolean=true;
  @State pro: boolean=false;

  build() {
    Row() {
      Column() {
        Component1({phone: $phone})
        Component2({pwd: $pwd})
        Component3({sexy: $sexy})
        Component4({pro: $pro})
        Component5({phone: this.phone, pwd: this.pwd, sexy: this.sexy, pro: this.pro})
      }
      .width('100%')
    }
    .height('100%')
  }
}