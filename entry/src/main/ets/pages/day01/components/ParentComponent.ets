/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 13:45
 */
import {SonComponent} from './SonComponent'

@Entry
@Component
struct ParentComponent{
  @State count2: number = 0;

  build(){
    Column({space: 10}){
      Text(`父组件计数: ${this.count2}`)
      Button(`父组件计数: +1`).onClick(() => { this.count2 += 1; })
      SonComponent({count: this.count2})
    }.width('100%').padding(10)
  }
}