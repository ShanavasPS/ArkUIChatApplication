// Second.ets
import router from '@ohos.router';
import MySlider from './TextComponent';

@Entry
@Component
struct ChatScreen {
  @State message: string = 'This is chat screen'
  @State username: string = ''
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Back')
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

