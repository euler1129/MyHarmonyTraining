/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-14 11:12
 */
@Component
export struct MyBuilderComponent{

  build(){}

  @Builder buildText(label: string){
    Text(label).textAlign(TextAlign.Center).padding(18).backgroundColor(Color.Blue).fontColor(Color.White)
  }

}
