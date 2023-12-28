import CalculateUtil from './CalculateUtil';
@Entry
@Component
struct Homework_Calculator {
  @State expression: string ="";
  @State result: string ="";

  private operator:string[] =['+','-','×','÷'];
  private operand:string[] =['0','1','2','3','4','5','6','7','8','9','%'];
  private arr1:string[] =['c','÷','×','←'];
  private arr2:string[] =['7','8','9','-'];
  private arr3:string[] =['4','5','6','+'];
  private arr4:string[] =['1','2','3'];
  private arr5:string[] =['%','0','.'];
  private arr6:string[] =['='];

  private toArray(exp:string): Array<string>{
    let arr:Array<string> =[];
    let temp:string = "";
    let startIndex = 0;
    for(let i=0;i<exp.length;i++) {
      if(!this.operator.includes(exp[i])) continue;
      arr.push(exp.substring(startIndex, i));
      arr.push(exp[i]);
      startIndex = i + 1;
      temp = exp[i];
    }
    if (arr.length > 0) {
      arr.push(exp.substring(exp.lastIndexOf(temp) + 1));
    }
    return arr;
  }

  @Builder buildButton(label: string, height: number|string){
    Button(label).width('22%').fontSize(50)
      //.textAlign(TextAlign.Center)
      .backgroundColor(Color.White)
      .fontColor(Color.Black)
      .border({width:1, color: Color.Black, radius: 30}).padding(2).height(height).margin(5)
      .onClick((event: ClickEvent) => {
        console.log(label);
        if(label === '=' && this.result != ""){
          this.expression += this.result;
          console.log(this.expression);
          let calResult = CalculateUtil.parseExpression(this.toArray(this.expression));
          this.expression = this.expression.concat('=', calResult);
          this.result = calResult;
        }else if(label === '←' && this.result !== ""){
          this.result = this.result.substring(0, this.result.length - 1);
        }else if(label === 'c'){
          this.expression = "";
          this.result = "";
        }else if(label === '.' &&  this.result != "" && this.result.charAt(this.result.length - 1) === '.'){
          console.log("do nothing");
        }else if(label === '.' &&  this.expression === "" &&  this.result === ""){
          console.log("do nothing");
        }else if(this.operator.includes(label) &&  this.result != ""){
          this.expression += this.result + label;
          this.result = "";
        }else if(this.operand.includes(label) || (label === '.' &&  this.result != "" && this.result.charAt(this.result.length - 1) != '.')){
          this.result += label;
        }
      })
  }

  build() {
    Column(){
      Row() {
        Text(this.expression).width('100%').fontSize(50).border({width:1, color: Color.Black}).border({width:1, color: Color.Black, radius: 10}).padding(20).height('29%')
      }.width('95%').margin(5)
      Row(){
        Text(this.result).width('100%').fontSize(50).textAlign(TextAlign.End).border({width:1, color: Color.Black, radius: 10}).padding(2).height(100)
      }.width('95%').margin(10)
      Row(){
        ForEach(this.arr1, (item, index) => {
          this.buildButton(item, 75);
        })
        // Text('C').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
        // Text('÷').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
        // Text('×').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
        // Text('←').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
      }
      Row(){
        ForEach(this.arr2, (item, index) => {
          this.buildButton(item, 75);
        })
        // Text('7').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
        // Text('8').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
        // Text('9').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
        // Text('-').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
      }
      Row(){
        ForEach(this.arr3, (item, index) => {
          this.buildButton(item, 75);
        })
        // Text('4').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
        // Text('5').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
        // Text('6').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
        // Text('+').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
      }
      Row(){
        Column(){
          Row(){
            ForEach(this.arr4, (item, index) => {
              this.buildButton(item, 75);
            })
            // Text('1').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
            // Text('2').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
            // Text('3').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
          }
          Row(){
            ForEach(this.arr5, (item, index) => {
              this.buildButton(item, 75);
            })
            // Text('%').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
            // Text('0').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
            // Text('.').width('22%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).height(75).margin(5)
          }
        }
        Column(){
          ForEach(this.arr6, (item, index) => {
            this.buildButton(item, '20%');
          })
          // Text('=').width('22%').height('20%').fontSize(50).textAlign(TextAlign.Center).border({width:1, color: Color.Black, radius: 30}).padding(2).margin(5)
        }
      }

    }


  }
}