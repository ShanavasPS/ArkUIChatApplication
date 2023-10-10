// Chats.ets

import UserList from './UserList';
@Entry
@Component
export default struct Chats {
  @State message: string = 'Hi, there'
  @State username: string = ''
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'search...' })
          .width('90%')
          .height(40)
          .backgroundColor('#FFFFFF')
          .margin({ top: 8 })
        UserList()
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Orange)
  }
}

