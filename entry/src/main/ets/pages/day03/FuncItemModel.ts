/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-17 17:12
 */
export default class FuncItemModel{
  icon:string;
  text: string;
  action: (url:string)=>void;


  constructor(icon:string, text: string, action?: (url:string)=>void) {
    this.icon = icon;
    this.text = text;
    this.action = action;
  }
}