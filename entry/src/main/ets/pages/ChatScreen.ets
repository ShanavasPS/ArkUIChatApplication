// Second.ets
import router from '@ohos.router';
import UserData from '../model/UserData';
import ChatList from './ChatList';

@Entry
@Component
struct ChatScreen {
  // @ts-ignore
  private userData: UserData = router.getParams().userData
  @State message: string = 'This is chat screen'
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40
  build() {
    Column() {
        PageTitle({userName: this.userData.name})
        ChatList({userName: this.userData.name})
    }
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
struct PageTitle {
  private userName: string
  build() {
    Flex({ alignItems: ItemAlign.Start }) {
      Image($r('app.media.app_icon'))
        .width(21.8)
        .height(19.6)
      Text(this.userName)
        .fontSize(21.8)
        .margin({left: 17.4})
    }
    .height(61)
    .margin({top: 36})
    .padding({ top: 13, bottom: 15, left: 28.3 })
    .onClick(() => {
      router.back()
    })
  }
}

