/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-16 15:10
 */
import common from '@ohos.app.ability.common'
import hilog from '@ohos.hilog'

@Entry
@Component
struct EventHub{
  private context = getContext(this) as common.UIAbilityContext

  build(){
    Row(){
      Column({space:10}){
        Button("订阅事件").fontSize(50).fontWeight(FontWeight.Bold).padding(30).onClick(()=>{
          this.context.eventHub.on('event1',(...data)=>{
            console.log("eventHubTestTag","2."+JSON.stringify(data));
          });
          hilog.info(0x0000,'eventHubTestTag','订阅事件event1');
        })
        Button("触发事件").fontSize(50).fontWeight(FontWeight.Bold).padding(30).onClick(()=>{
          this.context.eventHub.emit('event1');
          hilog.info(0x0000,'eventHubTestTag','订阅事件event1');
        })
        Button("取消事件").fontSize(50).fontWeight(FontWeight.Bold).padding(30).onClick(()=>{
          this.context.eventHub.off('event1');
          hilog.info(0x0000,'eventHubTestTag','订阅事件event1');
        })
      }.width('100%')
    }.height('100%')
  }

}