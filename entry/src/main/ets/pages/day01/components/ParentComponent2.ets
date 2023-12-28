/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 14:17
 */
import {SonComponent2} from './SonComponent2'

@Entry
@Component
struct ParentComponent2{
  @State count: number = 1;

  build(){
    Column({space: 10}){
      Text(`父组件计数: ${this.count}`)
      Button(`父组件计数: +1`).onClick(() => { this.count += 1; })
      SonComponent2({count2: $count})
    }.width('100%').padding(10)
  }
}