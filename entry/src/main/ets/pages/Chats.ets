// Chats.ets
import UserList from './UserList';

PersistentStorage.persistProp("persistedUser", "User 1");

@Component
export default struct Chats {
  @State message: string = 'Hi, there'
  @State username: string = ''
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40

  // @LocalStorageLink variable decorator creates two-way link with property "PropA" in LocalStorage
  @StorageLink("persistedUser") persistedUser: string = "None";

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'search...' })
          .width('90%')
          .height(40)
          .backgroundColor('#ECEFF1')
          .margin({ top: 8 })
        Blank('1')
          .backgroundColor('#ECEFF1')
          .margin({ top: 4 })
        UserList()
      }
      .width('100%')
    }
    .height('100%')
  }
}

