// Second.ets
import router from '@ohos.router';

@Entry
@Component
export default struct Chats {
  @State message: string = 'Hi, there'
  @State username: string = ''
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'search...' })
          .width('90%')
          .height(40)
          .backgroundColor('#FFFFFF')
          .margin({ top: 8 })

        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item:number) => {
            ListItem() {
              Button() {
                Row() {
                  Image($r('app.media.shanavas'))
                    .width(48)
                    .height(48)
                    .borderRadius(24)
                    .margin({left:8, right:8})
                  Text('username')
                    .width('70%')
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold)
                    .backgroundColor(Color.Green)
                    .align(Alignment.TopStart)
                }
              }
              .onClick(() => {
                router.pushUrl({ url: 'pages/ChatScreen' })
              })
            }.editable(true)
          }, (item:number) => item.toString())
        }
        .height('100%')
        .width('100%')
        .margin({ top: 12, left: '10%' })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Orange)
  }
}

