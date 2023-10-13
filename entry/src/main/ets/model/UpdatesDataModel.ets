import UpdatesData from './UpdatesData';

export default class UpdatesDataSource {
  private dataArray: Array<UpdatesData> = []

  private initialData: any[] = [
    { 'name': 'Shanavas Shaji', 'username': 'shanavas.shaji', 'image': $r('app.media.shanavas') },
    { 'name': 'Victoria Maslova', 'username': 'victoria.maslova', 'image': $r('app.media.victoria') },
    { 'name': 'Alexey Smolyaninov', 'username': 'alexey.smolyaninov', 'image': $r('app.media.alexey') },
    { 'name': 'Tatu Tomppo', 'username': 'tatu.tomppo', 'image': $r('app.media.dummy_user') },
    { 'name': 'Sarath Singapati', 'username': 'sarath.singapati', 'image': $r('app.media.dummy_user') },
    { 'name': 'Oleg Beletski', 'username': 'oleg.beletski', 'image': $r('app.media.dummy_user') },
    { 'name': 'Vidhya Priya', 'username': 'vidhya.priya', 'image': $r('app.media.dummy_user') },
  ]

  constructor() {
    this.initialData.forEach(item => {
      this.dataArray.push(new UpdatesData(item.name, item.username, item.image));
    })
  }

  public getData(username: string): Array<UpdatesData> {
    return this.dataArray.filter(item => (item.username !== username))
  }
}