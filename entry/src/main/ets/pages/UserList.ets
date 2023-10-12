import router from '@ohos.router'
import UserData from '../model/UserData'
import { initializeOnStartup } from '../model/UserDataModel'

@Entry
@Component
export default struct UserList {
  private users: UserData[] = initializeOnStartup()

  build() {
    List({ space: 8, initialIndex: 0 }) {
      ForEach(this.users, (item:UserData) => {
        ListItem() {
          Button() {
            Column() {
              Row() {
                Image(item.image)
                  .width(48)
                  .height(48)
                  .borderRadius(24)
                  .margin({left:8, right:8})
                Text(item.name)
                  .width('70%')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .align(Alignment.TopStart)
              }
              Blank('1')
                .backgroundColor('#ECEFF1')
                .margin({ top: 8 , left: 56 })
            }
          }
          .onClick(() => {
            router.pushUrl({
              url: 'pages/ChatScreen',
              params: { userData: item }
            })
          })
          .backgroundColor(Color.White)
        }.editable(true)
      }, (item:UserData) => item.id.toString())
    }
    .height('100%')
    .width('100%')
    .margin({ top: 12, left: '10%' })
  }
}