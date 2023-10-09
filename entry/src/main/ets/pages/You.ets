// Second.ets
import router from '@ohos.router';

@Entry
@Component
export default  struct You {
  @State message: string = 'Hi, there'
  @State username: string = 'Shanavas Shaji'
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40
  build() {
    Row() {
      Column() {
        Image($r('app.media.shanavas'))
          .width(100)
          .height(100)
        Text(this.username)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .margin({top: 8})
        Button() {
          Text('Logout')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Orange)
  }
}

