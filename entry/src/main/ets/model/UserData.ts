
let NextId = 0;

export default class UserData {
  id: string;
  name: string;
  username: string;
  image: string;

  constructor(name: string, username: string, image: string) {
    this.id = `${ NextId++ }`;
    this.name = name;
    this.username = username;
    this.image = image;
  }
}