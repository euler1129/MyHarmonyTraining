/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 13:51
 */
@Component
export struct SonComponent{
  @Prop count: number;
  build(){
    Column(){
      Text(`子组件计数: ${this.count}`)
      Button(`子组件 +1`).onClick(()=>{ this.count++; })
    }
  }
}