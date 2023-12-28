import MyContainer from './MyContainer'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State number: number = 0;

  build() {
    Row() {
      Column() {
        MyContainer({ header: '银行卡(1)', footer: '尾部' }) {
          Text('内容区域')
        }

        // Text(this.message)
        //   .fontSize(50)
        //   .fontWeight(FontWeight.Bold)
        // MyContainer({message: $message, number: this.number})
        // Text(`我是父组件的message: ${this.message}`)
        // Text(`我是父组件的number: ${this.number.toString()}`)
      }
      .width('100%')
    }
    .height('100%')
  }
}