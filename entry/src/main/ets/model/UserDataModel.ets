import UserData from './UserData';

const UserComposition: any[] = [
  { 'name': 'user 1', 'image': $r('app.media.shanavas') },
  { 'name': 'user 2', 'image': $r('app.media.shanavas') },
  { 'name': 'user 3', 'image': $r('app.media.icon') },
  { 'name': 'user 4', 'image': $r('app.media.startIcon') }
]

export function initializeOnStartup(): Array<UserData> {
  let UserDataArray: Array<UserData> = []
  UserComposition.forEach(item => {
    UserDataArray.push(new UserData(item.name, item.image));
  })
  console.log(UserDataArray.length.toString())
  console.log(UserDataArray.toString())
  return UserDataArray;
}