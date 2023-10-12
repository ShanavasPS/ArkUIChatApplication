// Chats.ets
import router from '@ohos.router';
import UserList from './UserList';


@Entry
@Component
export default struct Chats {
  @State message: string = 'Hi, there'
  @State username: string = ''
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40

  // @LocalStorageLink variable decorator creates two-way link with property "PropA" in LocalStorage
  @StorageLink("persistedUser") persistedUser: string = "User 2";

  aboutToAppear() {
    if(this.persistedUser == "None") {
      console.log("Nobody has logged in yet")
      router.pushUrl({ url: 'pages/Login' })
    } else {
      console.log(this.persistedUser + " had already logged in, so go to homepage")
      router.pushUrl({ url: 'pages/HomeScreen' })
    }
  }

  //PersistentStorage.deleteProp('highScore');
  build() {
    Row() {
      Column() {
        if(this.persistedUser == "None") {
          Text("Nobody has logged in already")
            .onClick(() => {
              // increment the decorated variable
              // the two-way sync semantics of @StorageLink decorator will cause
              // the changed value to be synched back to AppStorage "aProp" property.
              // According to the PersistentStorage.persistProp("aProp", ..) command the
              // changed value from AppStorage will automatically be persisted to file.
              this.persistedUser = "User 1"; // 51
              console.log(PersistentStorage.keys().toString())
            })
        } else {
          Text(this.persistedUser + "has already logged in")
        }
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Orange)
  }
}

