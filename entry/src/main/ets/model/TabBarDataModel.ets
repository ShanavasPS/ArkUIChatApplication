import TabBarData from './TabBarData';

export default class TabBarDataSource {
  private dataArray: Array<TabBarData> = []

  private initialData: any[] = [
    { 'text': 'Updates', 'num': 0, 'image': $r('app.media.updates'), 'image_selected': $r('app.media.updates_selected') },
    { 'text': 'Chats', 'num': 1, 'image': $r('app.media.chats'), 'image_selected': $r('app.media.chats_selected') },
    { 'text': 'You', 'num': 2, 'image': $r('app.media.settings'), 'image_selected': $r('app.media.settings_selected') }
  ]

  constructor() {
    this.initialData.forEach(item => {
      this.dataArray.push(new TabBarData(item.text, item.num, item.image, item.image_selected));
    })
  }

  public getData(): Array<TabBarData> {
    return this.dataArray
  }
}