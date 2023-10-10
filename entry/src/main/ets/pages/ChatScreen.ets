// Second.ets
import router from '@ohos.router';
import ChatList from './ChatList';

@Entry
@Component
struct ChatScreen {
  @State message: string = 'This is chat screen'
  @State username: string = ''
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40
  build() {
    Column() {
        PageTitle()
        ChatList()
    }
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
struct PageTitle {
  build() {
    Flex({ alignItems: ItemAlign.Start }) {
      Image($r('app.media.app_icon'))
        .width(21.8)
        .height(19.6)
      Text('User name')
        .fontSize(21.8)
        .margin({left: 17.4})
    }
    .height(61)
    .padding({ top: 13, bottom: 15, left: 28.3 })
    .onClick(() => {
      router.back()
    })
  }
}

