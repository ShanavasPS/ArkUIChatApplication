// Updates.ets
import router from '@ohos.router';

@Entry
@Component
export default struct Updates {
  @State message: string = 'Hi, there'
  @State username: string = ''
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    Row() {
      Column() {
        Text('Status')
          .width('90%')
          .height(40)
          .margin({ top: 8 })

        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item:number) => {
            ListItem() {
              Column() {
                Image($r('app.media.shanavas'))
                  .width(48)
                  .height(48)
                  .borderRadius(24)
                  .margin({left:8, right:8})
              }
            }.editable(true)
          }, (item:number) => item.toString())
        }
        .listDirection(Axis.Horizontal)
        .height('100%')
        .width('100%')
        .margin({ top: 12, left: '10%', right: '10%' })
      }
      .width('100%')
    }
    .height('100%')
  }
}

