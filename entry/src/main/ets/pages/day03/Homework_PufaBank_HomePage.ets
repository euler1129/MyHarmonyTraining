/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-16 18:57
 */
import FuncItemModel from './FuncItemModel'
import Homework_PufaBank_HomePage_Box from './Homework_PufaBank_HomePage_Box'

@Entry
@Component
struct Homework_PufaBank_HomePage {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  private scroller: Scroller = new Scroller()
  funcItemModel1: FuncItemModel[] = [
    new FuncItemModel(JSON.stringify($r('app.media.account')), "账户"),
    new FuncItemModel(JSON.stringify($r('app.media.credit_card')), "信用卡"),
    new FuncItemModel(JSON.stringify($r('app.media.borrow_money')), "借钱"),
    new FuncItemModel(JSON.stringify($r('app.media.owner')), "专属")
  ]
  funcItemModel2: FuncItemModel[] = [
    new FuncItemModel(JSON.stringify($r('app.media.licai')), "理财"),
    new FuncItemModel(JSON.stringify($r('app.media.jijing')), "基金"),
    new FuncItemModel(JSON.stringify($r('app.media.cunkuan')), "存款"),
    new FuncItemModel(JSON.stringify($r('app.media.zhuanzhang')), "转账"),
    new FuncItemModel(JSON.stringify($r('app.media.jiaoyimingxi')), "交易明细"),
  ]
  funcItemModel3: FuncItemModel[] = [
    new FuncItemModel(JSON.stringify($r('app.media.gerenyanglaojing')), "个人养老金"),
    new FuncItemModel(JSON.stringify($r('app.media.licaibao')), "理财宝"),
    new FuncItemModel(JSON.stringify($r('app.media.xiaopuzhifu')), "小浦支付"),
    new FuncItemModel(JSON.stringify($r('app.media.remenhuodong')), "热门活动"),
    new FuncItemModel(JSON.stringify($r('app.media.quanbu')), "全部")
  ]

  @Builder FuncItemBuilder(icon: string, name: string) {
    Column() {
      Image(JSON.parse(icon)).width(30).margin({ top: 5 })
      Text(name)
        //.fontColor(Color.White)
        .fontSize(12)
        .fontWeight(400)
        .lineHeight(30)
        .margin({ top: 5, bottom: 7 })
    }.width('100%')
  }

  @Builder TabBuilder(index: number, icon: string, name: string) {
    Column() {
      Image(JSON.parse(icon)).width(30).margin({ top: 5 })
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 5, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          Scroll(this.scroller) {
            Column() {
              Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
                Image($r('app.media.switch')).width(50)
                Search({ placeholder: '浦闪贷3%起利率优惠券' })
                Image($r('app.media.micro')).width(50)
                Image($r('app.media.plus_red')).width(50)
              }.width('100%')

              Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
                ForEach(this.funcItemModel1, funcItemModel => {
                  this.FuncItemBuilder(funcItemModel.icon, funcItemModel.text)
                })
              }.width('100%')

              Row() {
                Image($r('app.media.feeback')).width('100%').height(60)
              }.width('100%')

              Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Start }) {
                ForEach(this.funcItemModel2, funcItemModel => {
                  this.FuncItemBuilder(funcItemModel.icon, funcItemModel.text)
                })
              }.width('100%')

              Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Start }) {
                ForEach(this.funcItemModel3, funcItemModel => {
                  this.FuncItemBuilder(funcItemModel.icon, funcItemModel.text)
                })
              }.width('100%')


              Row() {
                Image($r('app.media.gift_area')).height(60)
              }.width('100%')

              Row() {
                Image($r('app.media.gosee_area')).height(60)
              }.width('100%')

              Row(){
                Homework_PufaBank_HomePage_Box({
                  boxTitle: '贷款推荐',
                  isShowBarMore: false,
                  actionUrl: 'pages/Index'
                }) {
                  Image($r('app.media.daikuantuijian')).width('95%')
                }
              }.width('100%')
              Row(){
                Homework_PufaBank_HomePage_Box({
                  boxTitle: '财富甄选',
                  isShowBarMore: true,
                  actionUrl: 'pages/Index' }) {
                  Image($r('app.media.caifuzhenxuan')).width('95%')
                }
              }.width('100%')
              Row(){
                Homework_PufaBank_HomePage_Box({
                  boxTitle: '浦惠生活',
                  isShowBarMore: false,
                  actionUrl: 'pages/Index'
                }) {
                  Image($r('app.media.puhuishenghuo')).width('95%')
                }
              }.width('100%')
              Row(){
                Homework_PufaBank_HomePage_Box({
                  boxTitle: '热点资讯',
                  isShowBarMore: false,
                  actionUrl: 'pages/Index'
                }) {
                  Image($r('app.media.redianzixun')).width('95%')
                }
              }.width('100%')
            }
            .width('100%')
          }
          .scrollable(ScrollDirection.Vertical)
          .scrollBar(BarState.Auto)
          .scrollBarColor(Color.Gray)
          .scrollBarWidth(10)
          .edgeEffect(EdgeEffect.Fade)
          .onScroll((xOffset: number, yOffset: number) => {
            console.info(xOffset + ' ' + yOffset)
          })
          .onScrollEdge((side: Edge) => {
            console.info('To the edge')
          })
          .onScrollEnd(() => {
            console.info('Scroll Stop')
          })
          //Column().width('100%').height('100%').backgroundColor('#00CB87')
        }
        .tabBar(this.TabBuilder(0, JSON.stringify($r('app.media.pufa_logo')), ''))
        .width('100%')
        .height('100%')

        TabContent() {
          //Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar(this.TabBuilder(1, JSON.stringify($r('app.media.shequ')), '社区'))

        TabContent() {
          //Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar(this.TabBuilder(2, JSON.stringify($r('app.media.caifu')), '财富'))

        TabContent() {
          //Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar(this.TabBuilder(3, JSON.stringify($r('app.media.shenghuo')), '生活'))

        TabContent() {
          //Column().width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar(this.TabBuilder(4, JSON.stringify($r('app.media.mine')), '我的'))
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barWidth(360)
      .barHeight(56)
      .animationDuration(400)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
    }
    .width('100%')
    .height('100%')
  }
}