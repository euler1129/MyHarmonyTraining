/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 14:20
 */
@Component
export struct SonComponent2{
  @Link count2: number;
  build(){
    Column(){
      Text(`子组件计数: ${this.count2}`)
      Button(`子组件 +1`).onClick(()=>{ this.count2++; })
    }
  }
}