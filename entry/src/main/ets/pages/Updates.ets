// Updates.ets
import { AppColors } from '../model/common';
import UpdatesData from '../model/UpdatesData';
import UpdatesDataSource from '../model/UpdatesDataModel';
import UserData from '../model/UserData';

@Entry
@Component
export default struct Updates {
  @StorageLink("persistedUser") persistedUser: string = "None";

  datasource: UpdatesDataSource = new UpdatesDataSource()
  updates: Array<UpdatesData> = this.datasource.getData(this.persistedUser)

  build() {
    Column() {
      Blank()
        .height(1)
        .width('100%')
        .backgroundColor(AppColors.separator)
        .align(Alignment.Top)
      Column() {
        Text('Status')
          .width('90%')
          .height(40)
          .margin({ top: 8 })
          .fontWeight(FontWeight.Bold)

        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.updates, (update: UpdatesData) => {
            ListItem() {
              Column() {
                Image(update.image)
                  .width(48)
                  .height(48)
                  .borderRadius(24)
                  .margin({left:8, right:8})
              }
            }.editable(true)
          }, (update:UpdatesData) => update.id.toString())
        }
        .listDirection(Axis.Horizontal)
        .width('100%')
        .margin({ top: 12, left: '10%', right: '10%' })
      }
      .width('100%')
    }
    .height('100%')
  }
}

